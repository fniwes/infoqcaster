package infoqcaster
class PresentationController {
    def infoqService

    def index(String url) {
        infoqService.information( url )
    }
}
