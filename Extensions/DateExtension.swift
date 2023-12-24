import Foundation

extension Date {
    func timeIntervalSinceStartOfDay() -> TimeInterval {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: self)
        return timeIntervalSince(startOfDay)
    }
}
