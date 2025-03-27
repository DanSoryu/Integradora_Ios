//
//  LoginViewController.swift
//  Integradora_Ios
//
//  Created by mac on 11/02/25.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txfEmail: UITextField!
    
    @IBOutlet weak var txfPassword: UITextField!
    
    @IBOutlet weak var ButtonIngresar: UIButton!
    
    @IBOutlet weak var LoginView: UIView!
    
    let token = Singleton.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Singleton.shared().abrirArchivo()
        
        let borderColor = UIColor(red: 142/255, green: 181/255, blue: 239/255, alpha: 1).cgColor
        let cornerRadius: CGFloat = 10

        let elements: [UIView] = [ txfEmail, txfPassword, ButtonIngresar]

        for element in elements {
            element.layer.borderWidth = 3
            element.layer.borderColor = borderColor
            element.layer.cornerRadius = cornerRadius
            element.clipsToBounds = true
        }

        LoginView.layer.cornerRadius = cornerRadius
        LoginView.clipsToBounds = true

    }
    
    
    @IBAction func login()
    {
        let conexion = URLSession(configuration: .default)

        var request = URLRequest(url:URL(string:"http://192.168.252.122:8000/api/auth/login")!)

        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        let email = txfEmail.text!
        let password = txfPassword.text!
    
        
        
        let json = ["email":email, "password":password]
        //print(json)
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        print(jsonData!)

        request.httpBody = jsonData
                
        conexion.dataTask(with: request) { datos, respuesta, error in
            
        //parsear la informacion
            do
            {
                
                let jsonResponse = try JSONSerialization.jsonObject(with: datos!, options: []) as! [String:Any]
                let token = jsonResponse["token"] as! String
                print(token)
                self.token.token = token
                self.token.guardarArchivo()
                
                DispatchQueue.main.async{
                    self.performSegue(withIdentifier: "sgLM", sender: nil)
                }
            }
            catch
            {
                print("algo salio mal")
            }
             
        }.resume()
    }
}
