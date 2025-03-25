//
//  SpMTableViewCell.swift
//  Integradora_Ios
//
//  Created by mac on 07/02/25.
//

import UIKit

class SpMTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var ImagenSensor: UIImageView!
    
    @IBOutlet weak var UltimoDato: UILabel!
    
    @IBOutlet weak var Sensor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
