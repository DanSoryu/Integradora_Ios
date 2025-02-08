//
//  SensorPorMonitorController.swift
//  Integradora_Ios
//
//  Created by mac on 07/02/25.
//

import UIKit

class SensorPorMonitorController: UIViewController {

    
    
    @IBOutlet weak var ButtonTitulo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        //REDONDEAR BOTON
        ButtonTitulo.layer.cornerRadius = ButtonTitulo.frame.size.height/2
        ButtonTitulo.layer.borderWidth = 2
        ButtonTitulo.layer.borderColor = UIColor.white.cgColor
        ButtonTitulo.layer.masksToBounds = true
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
