//
//  Result.swift
//  OpenWeatherJSON
//
//  Created by Usuario on 24/01/2023.
//  Copyright © 2023 Usuario. All rights reserved.
//

import UIKit


class Result: Codable {
    let dias:[Dia]?
    private enum CodingKeys: String, CodingKey{
        case dias = "list"
    }
}


struct Dia: Codable {
    let dt:CLong?
    let pop:Double?
    let weather:[Weather]?
    let main:Main?
    
    private enum CodingKeys: String, CodingKey{
        case dt = "dt"
         case pop = "pop"
         case main = "main"
        case weather = "weather"
    }
}
struct Weather:Codable {
    let descripcion:String?
    let icono:String?
    private enum CodingKeys: String, CodingKey{
            case descripcion = "description"
             case icono = "icon"
             
    }
    
}
struct Main:Codable {
      let min:Float
        let max:Float
        private enum CodingKeys: String, CodingKey{
            case min = "temp_min"
             case max = "temp_max"
             
    }
}

