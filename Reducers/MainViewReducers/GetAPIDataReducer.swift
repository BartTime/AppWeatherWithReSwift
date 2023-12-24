import ReSwift

func getApiData(action: Action, state: GetApiDataState?) -> GetApiDataState {
    var state = state ?? GetApiDataState()
    
    switch action {
    case let apiData as ApiResponseAction:
        state.apiData = apiData.data
        state.networkError = apiData.networkError
    default:
        break
    }
    
    return state
}
