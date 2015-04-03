package infoqcaster
class SelectorController {
    def index() {
        // Get Presentations from RSS Feed
        def xml = new XmlSlurper().parse("http://www.infoq.com/feed/presentations?token=NpiZ08bVi2xgRxi2BSXi0ArBW7CI67gi")
        return [items: xml.channel.item.collect {
            [title: it.title, url: it.link, description: it.description]
        }]
    }
}
