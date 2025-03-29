import UIKit

class ViewControllerFormulario: UIViewController{
    
<<<<<<< HEAD
=======
    @IBOutlet weak var txfUbicacion: UITextField!
    @IBOutlet weak var swTemperatura: UISwitch!
    @IBOutlet weak var txfNombreMonitor: UITextField!
    @IBOutlet weak var swCalidadAire: UISwitch!
    @IBOutlet weak var swNivelLuz: UISwitch!
    
    @IBOutlet weak var swMovimientoBebe: UISwitch!
    @IBOutlet weak var swEstadoBebe: UISwitch!
    var arreglo:[String]=[]
>>>>>>> main
    override func viewDidLoad() {
            super.viewDidLoad()
        }
        
    @IBAction func crearMonitor() {
        guardarMonitor()
    }

        
        func guardarMonitor() {
            if swCalidadAire.isOn
            {
                arreglo.append("1")
            }
            if swTemperatura.isOn
            {
                arreglo.append("2")
            }
            if swNivelLuz.isOn
            {
                arreglo.append("5")
            }
            if swEstadoBebe.isOn
            {
                arreglo.append("4")
            }
            if swMovimientoBebe.isOn
            {
                arreglo.append("3")
            }
            
            guard let nombre = txfNombreMonitor.text, !nombre.isEmpty,
                  let ubicacion = txfUbicacion.text, !ubicacion.isEmpty
            else {
                mostrarAlerta("Error", "Todos los campos son obligatorios.")
                return
            }
            
            let conexion = URLSession(configuration: .default)
            var request = URLRequest(url: URL(string: "http://192.168.137.243:8000/api/monitor")!)
            
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xMzcuNTU6ODAwMC9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTc0MzEyNDc1NSwibmJmIjoxNzQzMTI0NzU1LCJqdGkiOiIzZ0tzc0VHWkJ3N0tsQmoxIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJyb2wiOjJ9.D1HyMIJcshfvnn2SoysPr3bAk_Pa0gvfp_C6n3QYbho", forHTTPHeaderField: "Authorization")

            let json: [String: Any] = [
                "nombre": nombre,
                "ubicacion": ubicacion
            ]

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: json)
            } catch {
                mostrarAlerta("Error", "No se pudo codificar los datos.")
                return
            }

            conexion.dataTask(with: request) { datos, respuesta, error in
                        if let error = error {
                            print("Error en la petición: \(error.localizedDescription)")
                            return
                        }
                        
                        guard let httpResponse = respuesta as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode),
                              let datos = datos
                        else {
                            print("Error en la respuesta: \(respuesta.debugDescription)")
                            return
                        }
                        
                        do {
                            if let jsonResponse = try JSONSerialization.jsonObject(with: datos, options: []) as? [String: Any],
                               let idMonitor = jsonResponse["id"] as? Int {
                                
                                DispatchQueue.main.async {
                                    self.mostrarAlerta("Éxito", "Monitor creado correctamente.")
                                    self.agregarSensores(idMonitor: idMonitor)
                                }
                            }
                        } catch {
                            print("Error al procesar la respuesta JSON: \(error.localizedDescription)")
                        }
                    }.resume()
        }
    
    func agregarSensores(idMonitor: Int)
    {
        let conexion = URLSession(configuration: .default)
        for sensorid in arreglo
        {
            guard let url = URL(string: "http://192.168.137.243:8000/api/sensor/\(idMonitor)/\(sensorid)") else {continue}
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xMzcuNTU6ODAwMC9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTc0MzEyNDc1NSwibmJmIjoxNzQzMTI0NzU1LCJqdGkiOiIzZ0tzc0VHWkJ3N0tsQmoxIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJyb2wiOjJ9.D1HyMIJcshfvnn2SoysPr3bAk_Pa0gvfp_C6n3QYbho", forHTTPHeaderField: "Authorization")
                
                conexion.dataTask(with: request) { datos, respuesta, error in
                    if let error = error {
                    print("Error al asociar sensor \(sensorid): \(error.localizedDescription)")
                    return
                }
                    guard let httpResponse = respuesta as? HTTPURLResponse else {
                    print("No se recibió una respuesta válida para el sensor \(sensorid).")
                    return
                }
                    if (200...299).contains(httpResponse.statusCode) {
                        print("Sensor \(sensorid) asociado correctamente al monitor \(idMonitor).")
                } else {
                    print("Error en la respuesta al asociar sensor \(sensorid): \(httpResponse.statusCode)")
                }
            }.resume()
        }
    }
        
        
        func mostrarAlerta(_ titulo: String, _ mensaje: String) {
            DispatchQueue.main.async {
                let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alerta, animated: true)
            }
        }
    }
