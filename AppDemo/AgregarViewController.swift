//
//  AgregarViewController.swift
//  AppDemo
//
//  Created by ADMINISTRADORUTM on 06/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit

protocol AgregarViewControllerDelegate {
    
    func agregarRegistro(nombre: String, edad: Int)
    func modificarRegistro(nombre: String, edad: Int, fila: Int)

    
}


class AgregarViewController: UIViewController {

    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var txtError: UILabel!
    
    var nombre = ""
    var edad = 0
    var fila = -1
    
    var delegado : AgregarViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtNombre.text = nombre
        txtEdad.text = "\(edad)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func BtnGuardar_Click(_ sender: Any) {
        if delegado != nil{
            if (txtNombre.text != nil && (txtNombre.text?.characters.count)! > 0 ) && (txtEdad.text != nil && (txtEdad.text?.characters.count)! > 0 ) {
               
                if fila == -1{
                    delegado?.agregarRegistro(nombre: txtNombre.text!, edad: Int(txtEdad.text!)!)
                    
                }else{
                    delegado?.modificarRegistro(nombre: txtNombre.text!, edad: Int(txtEdad.text!)!, fila: fila)
                }
                
                
                
                self.navigationController!.popViewController(animated: true)
            }else{
                //txtError.isHidden = false
                
                let alert = UIAlertController(title: "Error", message: "Los campos introducidos no son válidos.", preferredStyle: .actionSheet)
                
                let defaultAction = UIAlertAction(title: "OK", style:.default, handler: {
                    (UIAlertAction) in
                })
                
                let cancelAction = UIAlertAction(title: "CANCELAR", style:.cancel, handler: {
                    (UIAlertAction) in
                    self.navigationController!.popViewController(animated: true)
                    
                })
                
                alert.addAction(defaultAction)
                alert.addAction(cancelAction)
                
                present(alert, animated: true, completion: {
                })
            }
            
            
            
           
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
