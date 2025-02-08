//
//  RegistrosDiaViewController.swift
//  Integradora_Ios
//
//  Created by mac32 on 07/02/25.
//

import UIKit

class RegistrosDiaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tblregistros: UITableView!
    
    struct Registro {
        let Fecha: String
        let Descripcion: String
        let Estado: String
        let imageName: String
    }
    
    let data: [Registro] = [
        Registro(Fecha:"21-12-2005", Descripcion:"Hola", Estado:"Good", imageName: "baby_triste"),
        Registro(Fecha:"21-12-2005", Descripcion:"Hola", Estado:"Good", imageName: "baby_triste"),
        Registro(Fecha:"21-12-2005", Descripcion:"Hola", Estado:"Good", imageName: "baby_triste"),
        Registro(Fecha:"21-12-2005", Descripcion:"Hola", Estado:"Good", imageName: "baby_triste"),
        Registro(Fecha:"21-12-2005", Descripcion:"Hola", Estado:"Good", imageName: "baby_triste"),
        Registro(Fecha:"21-12-2005", Descripcion:"Hola", Estado:"Good", imageName: "baby_triste")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblregistros.dataSource = self
        tblregistros.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let registro = data[indexPath.row]
        let cell = tblregistros.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.lblFecha.text = registro.Fecha
        cell.lblDescripcion.text = registro.Descripcion
        cell.lblEstado.text = registro.Estado
        cell.imvEstado.image = UIImage(named: registro.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100    }

}
