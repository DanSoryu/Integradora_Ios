//
//  ViewControlerFormulario.swift
//  Integradora_Ios
//
//  Created by mac on 05/02/25.
//

import UIKit

class ViewControlerFormulario: UIViewController {

    @IBOutlet weak var checkboxButton: UIButton!

        var isChecked = false

        override func viewDidLoad() {
            super.viewDidLoad()
            updateCheckbox()
        }

        @IBAction func checkboxTapped(_ sender: UIButton) {
            isChecked.toggle()
            updateCheckbox()
        }

        func updateCheckbox() {
            let imageName = isChecked ? "checkmark.square.fill" : "square"
            checkboxButton.setImage(UIImage(systemName: imageName), for: .normal)
        }

}
