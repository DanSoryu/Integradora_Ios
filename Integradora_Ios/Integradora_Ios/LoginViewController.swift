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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
