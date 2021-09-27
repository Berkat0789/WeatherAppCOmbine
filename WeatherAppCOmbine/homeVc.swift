//
//  ViewController.swift
//  WeatherAppCOmbine
//
//  Created by Yadilsa Diaz on 9/27/21.
//

import UIKit
import Combine

class homeVc: UIViewController {
    
    @IBOutlet weak var forecastTableView: UITableView!
    
    let forecastPublisher = PassthroughSubject<Forecast, Never>()
        
    private var forecastWeather = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        forecastTableView.register(UINib(nibName: K.cellIdandxibs.forecastCell, bundle: nil), forCellReuseIdentifier: K.cellIdandxibs.forecastCell)
        
        
        let forecastSubscriber = forecastPublisher.sink { data in
            self.forecastWeather = data.results
            DispatchQueue.main.async {
                self.forecastTableView.reloadData()
            }
        }
        
        forecastPublisher.send(Forecast(results: [
            Weather(location: "Newark", temp: 75, description: "Clowdy"),
            Weather(location: "South Orange", temp: 65, description: "Rain"),
            Weather(location: "East ORange", temp: 78, description: "Clowdy"),
            Weather(location: "Jersey City", temp: 78, description: "Clowdy"),
            Weather(location: "Newark", temp: 75, description: "Clowdy"),
            Weather(location: "South Orange", temp: 65, description: "Rain"),
            Weather(location: "East ORange", temp: 78, description: "Clowdy"),
            Weather(location: "Newark", temp: 75, description: "Clowdy"),
            Weather(location: "South Orange", temp: 65, description: "Rain"),
            Weather(location: "East ORange", temp: 78, description: "Clowdy")

            
        ]))
        
        forecastSubscriber.cancel()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    


}

extension homeVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weather = forecastWeather[indexPath.row]
        let foecastCell = forecastTableView.dequeueReusableCell(withIdentifier: K.cellIdandxibs.forecastCell, for: indexPath)
        foecastCell.textLabel?.text = weather.tempString
        foecastCell.detailTextLabel?.text = weather.location
        return foecastCell
    }
    
    
}

