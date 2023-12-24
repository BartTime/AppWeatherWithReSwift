import ReSwift

func bottomBarReducer(action: Action, state: BottomBarState?) -> BottomBarState {
    var state = state ?? BottomBarState()
    
    switch action {
    case let bottomBarAllCity as ButtonShowAllCityTappedAction:
        state.isButtonAllCityTapped = bottomBarAllCity.buttonPressed
    default:
        break
    }
    
    return state
}
