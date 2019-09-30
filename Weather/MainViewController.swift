//
//  MainViewController.swift
//  Weather
//
//  Created by Pi's Macbook on 9/23/19.
//  Copyright © 2019 Pi's Macbook. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var weatherObject = JSON_Weather()
    
    var lat: Double?
    var lon: Double?
    
    @IBOutlet weak var lblCityName: UILabel!
    
    @IBOutlet weak var lblDayAndTime: UILabel!
    
    @IBOutlet weak var imgWeather: UIImageView!
    
    @IBOutlet weak var lblWeather: UILabel!
    
    @IBOutlet weak var lblTemp: UILabel!
    
    @IBOutlet weak var lblSunrise: UILabel!
    
    @IBOutlet weak var lblSunrise2: UILabel!
    
    @IBOutlet weak var lblMax_temp: UILabel!
   
    @IBOutlet weak var lblHumidity: UILabel!
    
    @IBOutlet weak var lblPressure: UILabel!
    
    @IBOutlet weak var lblMin_temp: UILabel!
    
    var temp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
        let keyAPI = "&units=metric&lang=vi&APPID=0f17a750e711861498dc2d99cd03fa8d"
        getAPI(lat: lat!, lon: lon!, baseURL: baseURL, keyAPI: keyAPI)
    }
    
    func getAPI(lat: Double, lon: Double, baseURL: String, keyAPI: String) {
        let mainURL = baseURL + "lat=\(lat)" + "&" + "lon=\(lon)" + keyAPI
        print(mainURL)
        URLSession.shared.dataTask(with: URL(string: mainURL)!) { (data, response, err) in
            if let data = data {
                do{
                    self.weatherObject = try! JSONDecoder().decode(JSON_Weather.self, from: data)
                    DispatchQueue.main.async {
                        self.lblCityName.text = self.weatherObject.name
                        self.lblWeather.text = (self.weatherObject.weather![0].description)!
                        self.lblTemp.text = "Nhiệt độ: " + "\((self.weatherObject.main?.temp)!)"
                        self.lblMax_temp.text = "Nhiệt độ tối đa: " + "\((self.weatherObject.main?.temp_max)!)"
                        self.lblHumidity.text = "Độ ẩm: " + "\((self.weatherObject.main?.humidity)!)"
                        self.lblPressure.text = "Áp suất: " + "\((self.weatherObject.main?.pressure)!)"
                        self.lblMin_temp.text = "Nhiệt độ tối thiểu: " + "\((self.weatherObject.main?.temp_min)!)"
                        self.lblSunrise.text = "Mực nước biển: " + "1023.22"
                        self.lblSunrise2.text = "Mực grnd: " + "1013.75"
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
