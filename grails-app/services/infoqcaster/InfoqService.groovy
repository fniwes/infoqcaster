package infoqcaster

class InfoqService {
    def watched = [:]

    def recentPresentations() {
        def xml = new XmlSlurper().parse("http://www.infoq.com/feed/presentations?token=NpiZ08bVi2xgRxi2BSXi0ArBW7CI67gi")
        xml.channel.item.collect {
            [title: adaptPresentationName(it.title.toString()), url: it.link, description: it.description]
        }
    }

    def watchedPresentations() {
        watched.collect { key, value -> [title: value, url: key] }
    }

    def information( presentation ) {
        def useragent = "Mozilla/6.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/8.0 Mobile/10A5376e Safari/8536.25"
        def html = new URL(presentation).getText(requestProperties: ['User-Agent': useragent])

        // Parse HTML document
        def tagsoupParser = new org.ccil.cowan.tagsoup.Parser()
        def rootNode = new XmlSlurper(tagsoupParser).parseText(html)
        def title = rootNode.head.title.toString()

        def timesLine = ""
        def slidesLine = ""
        def videoLine = ""
        html.eachLine {
            if(it.contains("times = ")) timesLine = it;
            if(it.contains("slides = new Array")) slidesLine = it
            if(it.contains("mp4")) videoLine = it
        }

        def pattern = /\((.*)\)/
        def m = timesLine =~ pattern
        def times = m[0][0].replace("(", "[").replace(")", "]")

        pattern = /\((.*)\)/
        m = slidesLine =~ pattern
        def slides = m[0][0].replace("(", "[").replace(")", "]")

        def mp4 = videoLine =~ "\".*\""
        mp4 = (mp4[0]).replace("\"", "")

        [video: mp4, times: times, slides: slides, title: title, url: presentation]
    }

    def watch( String url, String title) {
        watched[url] = title
    }

    private String adaptPresentationName(String name) {
        if (name.startsWith("Presentation: ")) return name[14..-1]
        return name
    }
}