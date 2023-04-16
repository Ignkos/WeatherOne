//
//  MainView.swift
//  WeatherOne
//
//  Created by Ignat K on 28/02/2023.
//

import SwiftUI

struct MainView: View {
    var weather: ResponseBody
    var body: some View {
        
        Text("")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(weather: previewWeather)
    }
}
