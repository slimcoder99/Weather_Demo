//
//  ViewController.swift
//  Weather
//
//  Created by Pi's Macbook on 9/19/19.
//  Copyright © 2019 Pi's Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
   
    @IBOutlet weak var tableView: UITableView!
   
    var countryNameArr = ReadJSON.shared.getCity()
    
    var countryNameString = [String]()
    
    var searching = false
    var searchedCountry = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        countryNameArr.forEach { (city) in
            countryNameString.append(city.name!)
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedCountry.count
        }
        else {
            return countryNameArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchedCountry[indexPath.row]
        }
        else {
            cell?.textLabel?.text = countryNameArr[indexPath.row].name
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        for i in 0..<countryNameArr.count {
            if (countryNameArr[i].name == tableView.cellForRow(at: indexPath)?.textLabel?.text) {
                mainViewController.lat = countryNameArr[i].coord?.lat
                mainViewController.lon = countryNameArr[i].coord?.lon
                break
            }
        }
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCountry = countryNameString.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
}
