//
//  OpenWeather.swift
//  OpenWeatherJSON
//
//  Created by Usuario on 24/01/2023.
//  Copyright © 2023 Usuario. All rights reserved.
//

import UIKit

class OpenWeather: UITableViewController {
   
    var result:Result?
    
    override func viewDidLoad() {
      
        
        
               super.viewDidLoad()
             jsonDecoding()
                 

               
           }
         

           override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            guard let n = result?.dias!.count else{
                return 0
            }
             return n
            
           }

           
           override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaId", for: indexPath) as! Micelda

            let dia = result!.dias![indexPath.row]
                   
                    let max = dia.main!.max
                    let min = dia.main!.min
                    let pop = dia.pop
                    let newTime = dateFormatted((dia.dt)!, withFormat: "dd-MM-yyyy HH")
                  
               
            celda.lblTiempo.text = "\(newTime)"
            
           let minTempString = min
                   let minTempDouble = Double(minTempString) - 273
            celda.lblTempMin.text = "\(minTempDouble.rounded())º"
            let maxTempString = max
            let maxTempDouble = Double(maxTempString) - 273
            celda.lblTempMax.text = "\(maxTempDouble.rounded())º"
                     
            celda.lblProno.text =  dia.weather![0].descripcion
            celda.lblPreci.text =  "\(pop!)%"
            let ico = dia.weather![0].icono
                   ShowImage("http://openweathermap.org/img/wn/\(ico!)@2x.png", celda.icoWeather)

               return celda
           }
           func ShowImage(_ Url:String!,_ ivIco:UIImageView!)  {
                  let url = URL(string: Url)
                  let data = try? Data(contentsOf: url!)
                  ivIco.image = UIImage(data: data!)

              }
    func jsonDecoding() {
        let  urlTxt = "http://api.openweathermap.org/data/2.5/forecast?q=Toledo,es&mode&APPID=601c9db344b44f9774ef76a4c07979b1&lang=sp"


        guard let url = URL(string: urlTxt) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do {
                self.result =  try JSONDecoder().decode(Result.self, from: data)
            
                self.UI()
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
        }.resume()
        
    }
    func UI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    func dateFormatted(_ fechalong:Int, withFormat format : String) -> String{
         let date = Date(timeIntervalSince1970: TimeInterval(fechalong))
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = format
         return dateFormatter.string(from: date)
    }

    }


