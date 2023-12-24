import ReSwift

func getReceiveData(action: Action, state: GetReceiveDataState?) -> GetReceiveDataState {
    var state = state ?? GetReceiveDataState()
    
    switch action {
    case let data as ReceiveDataAction:
        state.data = data.data
    default:
        break
    }
    
    return state
}
