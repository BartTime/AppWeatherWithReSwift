import SwiftUI
import ReSwift


class StoreObserver: ObservableObject {
    @Published var appState: AppState

    init(initialState: AppState) {
        self.appState = initialState
        MainStore.subscribe(self)
    }
}

extension StoreObserver: StoreSubscriber {
    func newState(state: AppState) {
        DispatchQueue.main.async {
            self.appState = state
        }
    }
}
