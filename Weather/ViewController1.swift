//
//  ViewController1.swift
//  Weather
//
//  Created by Pi's Macbook on 9/19/19.
//  Copyright © 2019 Pi's Macbook. All rights reserved.
//

import UIKit

class ReadJSON {
    
    var city: [City]?
   
    static let shared = ReadJSON()

    func getCity () -> [City] {
        let url = Bundle.main.url(forResource: "city", withExtension: "json")
        
        guard let jsonData = url else {
            print("data not found")
            return []
        }
        
        guard let data = try? Data(contentsOf: jsonData) else {return []}
        
        let city = try? JSONDecoder().decode([City].self, from: data)
        
        return city!
    }
    
}
