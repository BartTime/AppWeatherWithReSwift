import SwiftUI
import ReSwift

class AppStateWrapper: ObservableObject {
    @Published var state: AppState

    init(initialState: AppState) {
        self.state = initialState
    }

    func updateState(_ newState: AppState) {
        self.state = newState
    }
}
