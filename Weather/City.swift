//
//  City.swift
//  Weather
//
//  Created by Pi's Macbook on 9/19/19.
//  Copyright © 2019 Pi's Macbook. All rights reserved.
//

import Foundation
import UIKit

class City: Codable {
    var id: Int?
    var name: String?
    var country: String?
    var coord: Coord?
}

struct Coord: Codable {
    var lon: Double?
    var lat: Double?
}
