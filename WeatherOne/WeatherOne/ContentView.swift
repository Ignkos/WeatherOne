//
//  ContentView.swift
//  WeatherOne
//
//  Created by Ignat  on 26.01.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    
    @State var weather: ResponseBody?
    
    var body: some View {
            VStack {
                if let location = locationManager.location{
                    if let weather = weather {
                        Text("gg")
                    } else {
                        LoadingView().task {
                            do{
                                weather = try await weatherManager.getWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{print("error getting weather:\(error)")}
                        }
                    }
                } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView()
                            .environmentObject(locationManager)
                        
                    }
                }
                
            }.background(.blue)


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
