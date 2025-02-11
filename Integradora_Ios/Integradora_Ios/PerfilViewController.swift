//
//  PerfilViewController.swift
//  Integradora_Ios
//
//  Created by mac on 07/02/25.
//

import UIKit

class PerfilViewController: UIViewController {

    
    @IBOutlet weak var imagen_perfil: UIImageView!
    
    @IBOutlet weak var formulario_actualizar: UIView!
    @IBOutlet weak var label_nombre: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagen_perfil.layer.cornerRadius = 20
        imagen_perfil.clipsToBounds = true
        
        label_nombre.layer.cornerRadius = 20
        label_nombre.clipsToBounds = true
        
        formulario_actualizar.layer.cornerRadius = 20
        formulario_actualizar.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
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
