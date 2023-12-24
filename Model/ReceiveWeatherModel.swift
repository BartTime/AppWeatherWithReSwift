import Foundation

struct ReceiveWeatherModel: Equatable {
    private var uv: Int = 0
    private var someAirQuality: Int = 0
    private var sunrise: String = ""
    private var sunset: String = ""
    private var tempWeatherList: [DayWeather] = []
    private var tenDaysMaxTemp = 0
    private var tenDaysMinTemp = 0
    
    
    var cityName: String = ""
    var weatherDesription: String = ""
    var tempMinNow: Int = 0
    var tempMaxNow: Int = 0
    var tempWearherHourList: [WeatherHour] = []
    var airQuality: ReciveAirQuality = ReciveAirQuality(intValue: 0, doubleValue: 0.0, meanValue: "")
    var weatherList: [DayReceiveWeather] = []
    var uvValue: UvIndexValue = UvIndexValue(stringValue: "", intValue: 0, doubleValue: 0.0)
    var sunsetSunriceValue: SunsetSunriseValue = SunsetSunriseValue(sunsetTime: "",
                                                                    suriseTime: "",
                                                                    doubleValueForGraph: 0.0)
    
}

extension ReceiveWeatherModel {
    mutating func prepareData(weatherModel: WeatherModel) {
        self.cityName = weatherModel.location.name
        self.sunrise = weatherModel.forecast.forecastday[0].astro.sunrise
        self.sunset = weatherModel.forecast.forecastday[0].astro.sunset
        
        self.weatherDesription = weatherModel.current.condition.text
        self.tempMinNow = Int(weatherModel.forecast.forecastday[0].day.mintempC)
        self.tempMaxNow = Int(weatherModel.forecast.forecastday[0].day.maxtempC)
        
        self.uv = weatherModel.current.uv
        self.someAirQuality = weatherModel.current.airQuality.usEpaIndex ?? 0
        
        self.tempWeatherList = getWeatherList(weatherModel: weatherModel.forecast.forecastday)
        self.tempWearherHourList = getHourWeatherList(data: weatherModel.forecast.forecastday)
        
        let minMaxTempTenDay = getMaxMinTempTenDay(data: self.tempWeatherList)
        
        self.tenDaysMinTemp = minMaxTempTenDay.0
        self.tenDaysMaxTemp = minMaxTempTenDay.1
        
        self.airQuality = getAirQuality(air: self.someAirQuality)
        
        self.weatherList = receiveWeatherList(data: self.tempWeatherList,
                                              tempMax: self.tenDaysMaxTemp,
                                              tempMin: self.tenDaysMinTemp)
        self.uvValue = getUvValue(uvValue: self.uv)
        self.sunsetSunriceValue = getSunsetSunriseValues(sunset: self.sunset,
                                                         sunrise: self.sunset)
    }
}

private extension ReceiveWeatherModel {
    func getSunsetSunriseValues(sunset: String, sunrise: String) -> SunsetSunriseValue {
        
        let secondsInADay: TimeInterval = 24 * 60 * 60
        let currentDate = Date()
        let percentageElapsed = (currentDate.timeIntervalSinceStartOfDay() / secondsInADay)
        
        let temp = SunsetSunriseValue(sunsetTime: sunset, suriseTime: sunrise, doubleValueForGraph: percentageElapsed)
        return temp
    }
    
    func getUvValue(uvValue: Int) -> UvIndexValue {
        var stringValue = ""
        switch uvValue {
        case 0:
            stringValue = "Low"
        case 1:
            stringValue = "Low"
        case 2:
            stringValue = "Low"
        case 3:
            stringValue = "Moderate"
        case 4:
            stringValue = "Moderate"
        case 5:
            stringValue = "Moderate"
        case 6:
            stringValue = "High"
        case 7:
            stringValue = "High"
        case 8:
            stringValue = "Very High"
        case 9:
            stringValue = "Very High"
        case 10:
            stringValue = "Very High"
        default:
            stringValue = "Extreme"
        }
        
        let doubleValue = doubleUvIndex(index: uvValue)
        
        return UvIndexValue(stringValue: stringValue,
                            intValue: uvValue,
                            doubleValue: doubleValue)
    }
    
    func receiveWeatherList(data: [DayWeather], tempMax: Int, tempMin: Int) -> [DayReceiveWeather] {
        var resList = [DayReceiveWeather]()
        
        for i in data {
            
            let doubleTempMax = Double(i.tempMaxList) / Double(tempMax)
            let doubleTempMin = Double(i.tempMinList) / Double(tempMin)
            let date = formatedData(date: i.date)
            
            let temp = DayReceiveWeather(tempMax: i.tempMaxList,
                                         tempMin: i.tempMinList,
                                         date: date,
                                         icon: i.icon,
                                         doubleTempMax: doubleTempMax,
                                         doubleTempMin: doubleTempMin)
            
            resList.append(temp)
        }
        
        return resList
    }
    
    func formatedData(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        var temp = ""
        
        if let date = dateFormatter.date(from: date) {
            let calendar = Calendar.current
            let dayOfWeek = calendar.component(.weekday, from: date)
            switch dayOfWeek {
            case 1:
                temp = "Su"
            case 2:
                temp = "Mo"
            case 3:
                temp = "Tu"
            case 4:
                temp = "We"
            case 5:
                temp = "Th"
            case 6:
                temp = "Fr"
            case 7:
                temp = "Sa"
            default:
                temp = ""
            }
        } else {
            temp = ""
        }
        return temp
    }
    
    func doubleUvIndex(index: Int) -> Double {
        return Double(index) / Double(11)
    }
    
    func getAirQuality(air: Int) -> ReciveAirQuality {
        
        let doubleValue = Double(air) / Double(6)
        
        var value = ""
        switch air {
        case 1:
            value = "Good"
        case 2:
            value = "Moderate"
        case 3:
            value = "Unhealthy for sensitive group"
        case 4:
            value = "Unhealthy"
        case 5:
            value = "Very Unhealthy"
        case 6:
            value = "Hazardous"
        default:
            value = "Undefined"
        }
        
        return ReciveAirQuality(intValue: air, doubleValue: doubleValue, meanValue: value)
    }
    
    func getMaxMinTempTenDay(data: [DayWeather]) -> (Int, Int) {
        var minTemp = data[0].tempMinList
        var maxTemp = data[0].tempMaxList
        
        for i in data {
            if i.tempMaxList > maxTemp {
                maxTemp = i.tempMaxList
            }
            if i.tempMinList < minTemp {
                minTemp = i.tempMinList
            }
        }
        
        return (minTemp, maxTemp)
    }
    
    func getWeatherList(weatherModel: [Forecastday]) -> [DayWeather] {
        let dayForecst = weatherModel
        var rezultArr = [DayWeather]()
        
        for i in dayForecst {
            let iconAndDay = getDayAndIconForDay(data: i)
            let temp = DayWeather(tempMaxList: Int(i.day.maxtempC), tempMinList: Int(i.day.mintempC), date: i.hour[0].time, icon: iconAndDay)
            rezultArr.append(temp)
        }
        
        return rezultArr
    }
    
    func getDayAndIconForDay(data: Forecastday) -> IconAndDayWeather {
        let temp = data.day.condition.icon.split(separator: "/")
        let isDay = temp[temp.count - 2] == "day" ? true : false
        let icon = temp[temp.count - 1]
        return IconAndDayWeather(day: isDay, icon: String(icon))
    }
    
    func getDayAndIconForHour(data: Hour) -> IconAndDayWeather {
        let temp = data.condition.icon.split(separator: "/")
        let isDay = temp[temp.count - 2] == "day" ? true : false
        let icon = temp[temp.count - 1]
        return IconAndDayWeather(day: isDay, icon: String(icon))
    }
    
    func getHourWeatherList(data: [Forecastday]) -> [WeatherHour] {
        var arr = [WeatherHour]()
        for day in data {
            if arr.count == 23 {
                break
            }
            
            for hour in day.hour {
                if arr.count == 23 {
                    break
                }
                let parseDayAndIcon = getDayAndIconForHour(data: hour)
                let convertedHour = convertToHour(date: hour.time)
                let temp = WeatherHour(day: parseDayAndIcon.day, icon: parseDayAndIcon.icon, temp: Int(hour.tempC), date: convertedHour)
                arr.append(temp)
            }
        }
        return arr
    }
    
    func convertToHour(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        if let date = dateFormatter.date(from: date) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH"
            
            let timeString = timeFormatter.string(from: date)
            return timeString
        } else {
            return ""
        }
    }
}

struct IconAndDayWeather: Equatable {
    var day: Bool
    var icon: String
}

struct WeatherHour: Equatable {
    var day: Bool
    var icon: String
    var temp: Int
    var date: String
}

struct DayWeather: Equatable {
    var tempMaxList: Int
    var tempMinList: Int
    var date: String
    var icon: IconAndDayWeather
}

struct DayReceiveWeather: Equatable {
    var tempMax: Int
    var tempMin: Int
    var date: String
    var icon: IconAndDayWeather
    
    var doubleTempMax: Double
    var doubleTempMin: Double
}

struct ReciveAirQuality: Equatable {
    var intValue: Int
    var doubleValue: Double
    var meanValue: String
}

struct UvIndexValue: Equatable {
    var stringValue: String
    var intValue: Int
    var doubleValue: Double
}

struct SunsetSunriseValue: Equatable {
    var sunsetTime: String
    var suriseTime: String
    
    var doubleValueForGraph: Double
}
