import Foundation

enum NetworkError: Error, Equatable {
    case invalidURL
    case requestFailed
    case invalidData
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Упс... произошла ошибка. Попробуйте позже"
        case .requestFailed:
            return "Упс.. проверьте ваше подключение к интернету"
        case .invalidData:
            return "Упс... произошла ошибка. Попробуйте позже"
        }
    }
}
