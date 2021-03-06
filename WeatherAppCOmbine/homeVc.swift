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
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    let forecastPublisher = PassthroughSubject<Forecast, Never>()
        
    private var forecastWeather = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        forecastTableView.register(UINib(nibName: K.cellIdandxibs.forecastCell, bundle: nil), forCellReuseIdentifier: K.cellIdandxibs.forecastCell)
        
        
        let forecastSubscriber = forecastPublisher.sink { data in
            self.forecastWeather = data.results
            //Adding one city detauls for testing
            let newark = data.results[0]
          
            DispatchQueue.main.async {
                self.cityName.text = newark.location
                self.tempLabel.text = "\(newark.tempString)℉"
                self.descriptionLabel.text = newark.description
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
        guard let foecastCell = forecastTableView.dequeueReusableCell(withIdentifier: K.cellIdandxibs.forecastCell, for: indexPath) as? forecastCell else {return UITableViewCell()}
        foecastCell.updateCell(weather: weather)
        return foecastCell
    }
    
    
}

