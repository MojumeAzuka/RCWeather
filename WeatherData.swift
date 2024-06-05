//
//  WeatherData.swift
//  RCWeather
//
//  Created by Azuka Mojume on 05/06/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    //The WeatherData struct is for handling Weather Data. It implements the Decodable protocol. The Decodable protocol allows a struct or class to decode JSON
    let name: String
    //name is a WeatherData property of the String type
    let main: Main
    //main is a WeatherData property of the Main type
}

struct Main: Decodable{
    //The Main struct is for handling information that comes from openweather
    let temp: Double
    //the temp variable is a Main property of the Double type
}
