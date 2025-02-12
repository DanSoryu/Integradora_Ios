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
        Sensor(Sensor:"Temperatura ambiente",UltimoDato: "22 C",ImagenSensor:"img_2"),
        Sensor(Sensor:"Calidad del Aire",UltimoDato: "Buena",ImagenSensor:"baby_triste"),
        Sensor(Sensor:"Nivel de Luz",UltimoDato: "Moderado",ImagenSensor:"img_4"),
        Sensor(Sensor:"Estado del Bebè",UltimoDato: "Durmiendo",ImagenSensor:"img_3"),
        Sensor(Sensor:"Movimiento del Bebè",UltimoDato: "Sin Movimiento",ImagenSensor:"img_5")
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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
