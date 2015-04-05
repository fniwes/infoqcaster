package infoqcaster
class SelectorController {
    def infoqService

    def index() {
        [
            items: infoqService.recentPresentations(),
            watched: infoqService.watchedPresentations()
        ]
    }
}
