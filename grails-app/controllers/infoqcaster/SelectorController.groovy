package infoqcaster
class SelectorController {
    def index() {
        // Get Presentations from RSS Feed
        def xml = new XmlSlurper().parse("http://www.infoq.com/feed/presentations?token=NpiZ08bVi2xgRxi2BSXi0ArBW7CI67gi")
        return [items: xml.channel.item.collect {
            [title: adaptPresentationName(it.title.toString()), url: it.link, description: it.description]
        }]
    }

    private String adaptPresentationName(String name) {
        if (name.startsWith("Presentation: ")) return name[14..-1]
        return name
    }
}
