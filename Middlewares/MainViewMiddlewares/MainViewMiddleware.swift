import Foundation
import ReSwift

let mainMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            if let apiAction = action as? ApiRequestAction {
                NetworkManager.shared.request(WeatherModel.self, method: .get, urlString: "https://api.weatherapi.com/v1/forecast.json?key=91597ec394b34014a45213111231712&q=Moscow&days=10&aqi=yes") { result in
                    switch result {
                    case .success(let model):
                        dispatch(ApiResponseAction(networkError: nil, data: model))
                    case .failure(let error):
                        dispatch(ApiResponseAction(networkError: error, data: nil))
                    }
                }
            }
            
            if let action = action as? ApiRequestActionDeleteError {
                dispatch(ApiResponseAction(networkError: nil, data: nil))
            }
            
            if let action = action as? ReceiveDataRequestAction {
                var model = ReceiveWeatherModel()
                model.prepareData(weatherModel: action.data)
                dispatch(ReceiveDataAction(data: model))
            }
//            if let action = action as? ButtonRequestAction {
//                let currentState = getState()
//
//                let tempState = !(currentState?. ?? true)
//
//                dispatch(ButtonTappedAction(buttonPressed: tempState))
//            }
            
            if let action = action as? ButtonShowAllCityRequestAction {
                
                dispatch(ButtonShowAllCityTappedAction(buttonPressed: true))
            }
            
            return next(action)
        }
    }
}
