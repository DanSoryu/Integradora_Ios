//
//  MonitorUsuarioViewController.swift
//  Integradora_Ios
//
//  Created by mac on 26/03/25.
//

import UIKit

class MonitorUsuarioViewController: UIViewController {
    
    let token = Singleton.shared()
    var monitores: [Monitor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        consultarMonitores()
            

       
    }
    
    func consultarMonitores()
    {
        let conexion = URLSession(configuration: .default)

        print("Token cargado:", token.token)
        
        var request = URLRequest(url: URL(string: "http://192.168.252.122:8000/api/monitores")!)

        request.httpMethod = "GET"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        

        request.setValue("Bearer \(token.token)", forHTTPHeaderField: "Authorization")
        
        conexion.dataTask(with: request) { datos, response, error in
            do
            {
                let json = try JSONSerialization.jsonObject(with: datos!) as! [[String:Any]]
                for monitor in json
                {
                    self.monitores.append(Monitor(id_monitor: monitor["id"] as! String, user_id: monitor["user_id"] as! String, Nombre_Monitor: monitor["nombre_monitor"] as! String, Ubicacion: monitor["ubicacion"] as! String))
                }
                print(self.monitores)
                DispatchQueue.main.async {
                   self.dibujarMonitores()
                }
            }
            catch
            {
                print("algo salio mal")
            }
        }.resume()
    }
    
    func dibujarMonitores()
    {
        
    }

}
