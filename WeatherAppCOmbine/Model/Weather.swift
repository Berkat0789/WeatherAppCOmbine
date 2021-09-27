//
//  Weather.swift
//  WeatherAppCOmbine
//
//  Created by Yadilsa Diaz on 9/27/21.
//

import Foundation




struct Forecast{
    let results: [Weather]
}


struct Weather {
    let location: String
    let temp: Double
    let description: String
    
    // Computed Property to ocnvert temp to a string
    var tempString: String {
        return String(format: "%.1f", temp)
    }
}
