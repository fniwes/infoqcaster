package infoqcaster
class PresentationController {

    def index() {
    	def useragent = "Mozilla/6.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/8.0 Mobile/10A5376e Safari/8536.25"
    	def presentation = "http://www.infoq.com/presentations/demo-java-javascript-mongodb"

    	def timesLine = ""
    	def slidesLine = ""
    	def videoLine = ""
    	new URL(presentation).getText(requestProperties: ['User-Agent': useragent]).eachLine {
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

    	[video: mp4, times: times, slides: slides]
    }
}
