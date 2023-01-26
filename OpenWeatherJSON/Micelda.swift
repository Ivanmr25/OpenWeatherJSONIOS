//
//  Micelda.swift
//  OpenWeatherJSON
//
//  Created by Usuario on 24/01/2023.
//  Copyright © 2023 Usuario. All rights reserved.
//

import UIKit

class Micelda: UITableViewCell {

    @IBOutlet weak var icoWeather: UIImageView!
    
    @IBOutlet weak var lblProno: UILabel!
    
    @IBOutlet weak var lblTiempo: UILabel!
    
    @IBOutlet weak var lblPreci: UILabel!
    
    @IBOutlet weak var lblTempMin: UILabel!
    @IBOutlet weak var lblTempMax: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
