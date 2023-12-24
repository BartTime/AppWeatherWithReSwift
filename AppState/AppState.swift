import ReSwift

struct AppState: StateType, Equatable {    
    var bottomBarState: BottomBarState
    var getApiDataState: GetApiDataState
    var getReceiveDataState: GetReceiveDataState
}

struct BottomBarState: StateType, Equatable {
    var isButtonAllCityTapped = false
}

struct GetReceiveDataState: StateType, Equatable {
    var data: ReceiveWeatherModel? = nil
}

struct GetApiDataState: StateType, Equatable {
    var apiData: WeatherModel? = nil
    var networkError: NetworkError? = nil
}

let MainStore = Store(
    reducer: appReducer,
    state: nil,
    middleware: [mainMiddleware]
)
