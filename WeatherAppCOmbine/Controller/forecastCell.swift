//
//  forecastCell.swift
//  WeatherAppCOmbine
//
//  Created by Yadilsa Diaz on 9/27/21.
//

import UIKit

class forecastCell: UITableViewCell {

    @IBOutlet weak var forecastContainer: UIView!
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.forecastContainer.layer.cornerRadius = self.forecastContainer.frame.height / 8
    }
    
    func updateCell(weather: Weather) {
        self.cityName.text = weather.location
        self.tempLabel.text = "\(weather.tempString)℉"
        self.descriptionLabel.text = weather.description
    }
}
