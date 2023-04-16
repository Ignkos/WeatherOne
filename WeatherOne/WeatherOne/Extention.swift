//
//  Extention.swift
//  WeatherOne
//
//  Created by Ignat K on 28/02/2023.
//

import Foundation
import UIKit
import MapKit

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}


extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
