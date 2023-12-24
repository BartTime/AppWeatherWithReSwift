import ReSwift

struct ApiRequestAction: Action {
    
}

struct ApiRequestActionDeleteError: Action {
    
}

struct ApiResponseAction: Action {
    let networkError: NetworkError?
    let data: WeatherModel?
}

struct ButtonRequestAction: Action {
    
}

struct ButtonTappedAction: Action {
    let buttonPressed: Bool
}

struct ButtonShowAllCityRequestAction: Action {
    
}

struct ButtonShowAllCityTappedAction: Action {
    let buttonPressed: Bool
}

struct ReceiveDataRequestAction: Action {
    let data: WeatherModel
}

struct ReceiveDataAction: Action {
    let data: ReceiveWeatherModel
}
