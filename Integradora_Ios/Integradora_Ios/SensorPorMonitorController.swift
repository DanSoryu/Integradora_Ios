//
//  SensorPorMonitorController.swift
//  Integradora_Ios
//
//  Created by mac on 07/02/25.
//

import UIKit

class SensorPorMonitorController: UIViewController, UITableViewDataSource ,UITableViewDelegate{
    

    @IBOutlet weak var Tabla: UITableView!
    @IBOutlet weak var ButtonTitulo: UIButton!
    
    struct Sensor {
        let Sensor : String
        let UltimoDato : String
        let ImagenSensor : String
    }
    
    //arreglo de objetos
    let data:[Sensor] = [
        Sensor(Sensor:"Temperatura ambiente",UltimoDato: "22 C",ImagenSensor:"bebecito2"),
        Sensor(Sensor:"Calidad del Aire",UltimoDato: "Buena",ImagenSensor:"bebecito1"),
        Sensor(Sensor:"Nivel de Luz",UltimoDato: "Moderado",ImagenSensor:"bebecito4"),
        Sensor(Sensor:"Estado del Bebè",UltimoDato: "Durmiendo",ImagenSensor:"bebecito3"),
        Sensor(Sensor:"Movimiento del Bebè",UltimoDato: "Sin Movimiento",ImagenSensor:"bebecito5")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //REDONDEAR BOTON
        ButtonTitulo.layer.cornerRadius = 8
        ButtonTitulo.layer.borderWidth = 2
        ButtonTitulo.layer.borderColor = UIColor.clear.cgColor
        ButtonTitulo.layer.masksToBounds = true
        
        
        //UITABLE VIEW
        Tabla.dataSource = self
        Tabla.delegate = self
        
        //look good
        Tabla.separatorStyle = .none
        Tabla.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sensor = data[indexPath.row]
        let cell = Tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpMTableViewCell
        cell.Sensor.text = sensor.Sensor
        cell.UltimoDato.text = sensor.UltimoDato
        cell.ImagenSensor.image = UIImage(named: sensor.ImagenSensor)
        
        
        cell.contentView.layer.cornerRadius = 35
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = UIColor.systemPink.cgColor

        // Agregar margen a la celda con contentInsets
        cell.contentView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
