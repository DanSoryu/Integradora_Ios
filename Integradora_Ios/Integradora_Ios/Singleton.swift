//
//  Singleton.swift
//  Integradora_Ios
//
//  Created by mac on 26/03/25.
//

import UIKit

class Singleton: NSObject {
    
    //var BASE_URL: String = "http://192.168.252.106:8000/api"
    var token: String
    static var single:Singleton!
    
    override init() {
        token = ""
    }
    
    static func shared() -> Singleton
    {
        if single == nil
        {
            single = Singleton.init()
        }
        
        return single
    }
    
    //metodos para guardar el token
    func abrirArchivo()
    {
        //
        let ruta = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/AuthToken.plist"
        print(ruta)
        //NORMALIZA LA RUTA
       let urlArchivo = URL(fileURLWithPath: ruta)
        print(urlArchivo)
        
        do
        //ABRIR EL ARCHIVO
        {
            //se le pone try pq no se garantiza que exista el archivo
            let archivo = try Data.init(contentsOf: urlArchivo)
            print(archivo)
            
            let diccionario = try PropertyListSerialization.propertyList(from: archivo, format: nil) as! [String:Any]
           token = diccionario["token"] as! String
            
        }
        catch
        {
            print("el archivo aun nno existe")
        }
    }



//Guarda archivo persistente plist
    func guardarArchivo()
    {
        let ruta = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/AuthToken.plist"
        print(ruta)
        let urlArchivo = URL(fileURLWithPath: ruta)
        let diccionario:[String:Any] = ["token":token]
        do
        {
            let archivo = try PropertyListSerialization.data(fromPropertyList: diccionario, format: .xml, options: NSPropertyListWriteStreamError)
            try archivo.write(to: urlArchivo)
        }
        catch
        {
            print("ola")
        }
    }



}
