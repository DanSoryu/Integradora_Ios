//
//  Monitor.swift
//  Integradora_Ios
//
//  Created by mac on 27/03/25.
//

import UIKit

class Monitor: NSObject {
    
    var id_monitor = ""
    var user_id = ""
    var Nombre_Monitor = ""
    var Ubicacion = ""
    
    init(id_monitor: String, user_id: String, Nombre_Monitor: String, Ubicacion: String) {
        self.id_monitor = id_monitor
        self.user_id = user_id
        self.Nombre_Monitor = Nombre_Monitor
        self.Ubicacion = Ubicacion
    }
    
    override var description: String {
        return "\(Nombre_Monitor) - \(Ubicacion)"
    }

}
