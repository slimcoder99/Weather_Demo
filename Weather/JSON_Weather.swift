//
//  JSON_Weather.swift
//  Weather
//
//  Created by Pi's Macbook on 9/23/19.
//  Copyright © 2019 Pi's Macbook. All rights reserved.
//

import Foundation
import UIKit

class JSON_Weather: NSObject, Codable {
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    
    override init() {
    }
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Sys: Codable {
    var message: Double?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}

struct Main: Codable {
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var temp_min: Double?
    var temp_max: Double?
    var sea_level: Double?
    var grnd_level: Double?
}

struct Wind: Codable {
    var speed: Double?
    var deg: Double?
}

struct Clouds: Codable {
    var all: Double?
}
