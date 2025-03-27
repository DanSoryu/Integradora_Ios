//
//  RegisterViewController.swift
//  Integradora_Ios
//
//  Created by mac on 11/02/25.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txfNombre: UITextField!
    
    @IBOutlet weak var txfEmail: UITextField!
    
    @IBOutlet weak var txfPassword: UITextField!
    
    @IBOutlet weak var RegisterView: UIView!
    
    @IBOutlet weak var ButtonRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let borderColor = UIColor(red: 142/255, green: 181/255, blue: 239/255, alpha: 1).cgColor
        let cornerRadius: CGFloat = 10

        let elements: [UIView] = [txfNombre, txfEmail, txfPassword, ButtonRegister]

        for element in elements {
            element.layer.borderWidth = 3
            element.layer.borderColor = borderColor
            element.layer.cornerRadius = cornerRadius
            element.clipsToBounds = true
        }

        RegisterView.layer.cornerRadius = cornerRadius
        RegisterView.clipsToBounds = true
    }
    
    //REGISTER HARCODEADO

    @IBAction func register() {
        
            let conexion = URLSession(configuration: .default)

            var request = URLRequest(url:URL(string:"http://192.168.252.122:8000/api/auth/register")!)

            request.httpMethod = "POST"

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
            let nombre = txfNombre.text!
            let email = txfEmail.text!
            let password = txfPassword.text!
        
            
            
            let json = ["name":nombre, "email":email, "password":password]
            //print(json)
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            //print(jsonData)

            request.httpBody = jsonData
                    
        conexion.dataTask(with: request) { datos, respuesta, error in
            
            
                
                print("ETSITO")
                DispatchQueue.main.async{
                self.performSegue(withIdentifier: "sgRL", sender: nil)
                }
                
            
                
            }.resume()
            
    }
    
}
