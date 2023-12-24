import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState(
        bottomBarState: BottomBarState(),
        getApiDataState: GetApiDataState(),
        getReceiveDataState: GetReceiveDataState()
    )
    
    state.getApiDataState = getApiData(action: action, state: state.getApiDataState)
    state.bottomBarState = bottomBarReducer(action: action, state: state.bottomBarState)
    state.getReceiveDataState = getReceiveData(action: action, state: state.getReceiveDataState)
    return state
}
