//
//  WeatherManager.swift
//  WeatherOne
//
//  Created by Ignat  on 02.02.2023.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

class WeatherManager{
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=75468027886366d99adf85530b78f384&units=metric") else{
            fatalError("missing weather URL")
        }
        
        var urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decData
    }
    
}

struct CoordinatesResponse: Codable {
    
    var lon: Double
    var lat: Double
}
struct WeatherResponse: Codable {
    
    var id: Double
    var main: String
    var description: String
    var icon: String
}

struct MainResponse: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct WindResponse: Codable {
    
    var speed: Double
    var deg: Double
}
struct ResponseBody: Codable {
    
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
}


