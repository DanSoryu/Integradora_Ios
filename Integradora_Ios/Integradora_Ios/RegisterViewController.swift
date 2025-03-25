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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
