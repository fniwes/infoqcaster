package infoqcaster
class PresentationController {
    def infoqService

    def index(String url) {
        def result = infoqService.information( url )
        infoqService.watch( result.url, result.title )
        result
    }
}
