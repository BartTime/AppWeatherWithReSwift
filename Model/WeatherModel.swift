import Foundation

struct WeatherModel: Codable, Equatable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

// MARK: - Current
struct Current: Codable, Equatable {
    let tempC: Int
    let condition: CurrentCondition
    let uv: Int
    let airQuality: AirQuality

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition, uv
        case airQuality = "air_quality"
    }
}

// MARK: - AirQuality
struct AirQuality: Codable, Equatable {
    let usEpaIndex: Int?

    enum CodingKeys: String, CodingKey {
        case usEpaIndex = "us-epa-index"
    }
}

// MARK: - CurrentCondition
struct CurrentCondition: Codable, Equatable {
    let text: String
    let icon: String
}

// MARK: - Forecast
struct Forecast: Codable, Equatable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable, Equatable {
    let day: Day
    let astro: Astro
    let hour: [Hour]
}

// MARK: - Astro
struct Astro: Codable, Equatable {
    let sunrise: String
    let sunset: String
}

// MARK: - Day
struct Day: Codable, Equatable {
    let maxtempC, mintempC: Double
    let condition: DayCondition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}

// MARK: - DayCondition
struct DayCondition: Codable, Equatable {
    let icon: String
}

// MARK: - Hour
struct Hour: Codable, Equatable {
    let time: String
    let tempC: Double
    let condition: DayCondition

    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
    }
}

// MARK: - Location
struct Location: Codable, Equatable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
