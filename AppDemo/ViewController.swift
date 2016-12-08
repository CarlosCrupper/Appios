//
//  ViewController.swift
//  AppDemo
//
//  Created by adminisitradorUTM on 05/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleViewControllerDelegate, AgregarViewControllerDelegate{
    
   // var array = ["Hola"]
    
    var filaSeleccionada = -1
    
   
    @IBOutlet weak var tblTabla: UITableView!
    
    var esEdicion = false
    
    var datos = [("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20),
                 ("Alan", 30),
                 ("Carlos", 21),
                 ("Eduardo", 12),
                 ("Jorge", 23),
                 ("Marina", 12),
                 ("Martha", 20)]
    
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    
    
    @IBAction func btnAgregar_Click(_ sender: Any) {
        performSegue(withIdentifier: "Agregar Segue", sender: self)
    }
    
    
    @IBAction func btnRefresh(_ sender: Any) {
        //let url = URL(string: "https://s-media-cache-ak0.pinimg.com/originals/56/24/01/5624015d24089c606e652d6e569c0982.png")
        
        //let url = URL(string: "http://es.fordesigner.com/imguploads/Image/cjbc/zcool/png20080526/1211804902.png")
        
        let idFacebook = FBSDKAccessToken.current().userID
        
        let cadenaUrl = "http://graph.facebook.com/\(idFacebook!)/picture?type=large"
        
       /* let url = URL(string: cadenaUrl)
        let dato : Data?
        
        
        do{
            dato = try Data(contentsOf: url!)
            imgFoto.image = UIImage(data: dato!)
        }catch{
            print("Error cargando la imagen.! \(error.localizedDescription)")
            dato = nil
            imgFoto.image = UIImage(named: "disco")*/
        
        imgFoto.loadPicture(url: cadenaUrl)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("vista cargada")
        imgFoto.image = UIImage(named: "disco")
        lblNombre.text = "Carlos"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func agregarRegistro(nombre: String, edad: Int){
        datos.append((nombre,edad))
        tblTabla.reloadData()

    }
    
    func modificarRegistro(nombre: String, edad: Int, fila: Int){
        datos.remove(at: fila)
        datos.insert((nombre, edad), at: fila)
        tblTabla.reloadData()
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier!{
            case "Detalle Segue":
                let view = segue.destination as! DetalleViewController
                view.numeroFila = filaSeleccionada
                
                view.numeroFila = filaSeleccionada
                view.dato = datos[filaSeleccionada].0
                view.datoNumero = datos[filaSeleccionada].1
                
                view.delegado = self
                
            break
            
                case "Agregar Segue":
                let view = segue.destination as! AgregarViewController
                
                if(esEdicion){
                    view.fila = filaSeleccionada
                    view.nombre = datos[filaSeleccionada].0
                    view.edad = datos[filaSeleccionada].1
                    esEdicion = false
                }
                
                view.delegado = self
                break
        default:
            break
            
        }
        
        
        
       
    }
    
    
    
    
    func numeroCambiado(numero : Int){
        print("Numero cambiado: \(numero)")
        datos[numero].1 = datos[numero].1 + 1
        tblTabla.reloadData()
    }
    
    
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return datos.count
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let eliminar = UITableViewRowAction(style: .destructive, title: "Borrar", handler: borrarFila)
        let editar = UITableViewRowAction(style: .normal, title: "Editar", handler: editarFila)
        
        return[eliminar, editar]
    }
    
    func borrarFila(sender: UITableViewRowAction, indexpath : IndexPath){
        datos.remove(at: indexpath.row)
        tblTabla.reloadData()
    }
    
    func editarFila(sender: UITableViewRowAction, indexpath : IndexPath){
        esEdicion = true
        filaSeleccionada = indexpath.row
        performSegue(withIdentifier: "Agregar Segue", sender: sender)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        /*let proto = (indexPath.row % 2 == 0) ? "proto1" : "proto2"
        
        let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! FilaTableViewCell
        
        if(indexPath.row % 2 == 0){
            vista.lbIzquierda.text = "Index!"
            vista.lbDerecha.text = "\(indexPath.row)"
        }else
        {
            vista.lbDerecha.text = "Index!"
            vista.lbIzquierda.text = "\(indexPath.row)"
        }
        
        return vista*/
        
        //F2
        
       let vista = tableView.dequeueReusableCell(withIdentifier: "proto1", for: indexPath) as! FilaTableViewCell
        
            vista.lbIzquierda.text = "\(datos[indexPath.row].0)"
            vista.lbDerecha.text = "\(datos[indexPath.row].1)"
        
        let idFacebook = FBSDKAccessToken.current().userID
        
        let cadenaUrl = "http://graph.facebook.com/\(idFacebook!)/picture?type=large"
        
        let url = URL(string: cadenaUrl)
        let dato : Data?
        
        
        do{
            dato = try Data(contentsOf: url!)
            vista.imgFoto.image = UIImage(data: dato!)
        }catch{
            print("Error cargando la imagen.! \(error.localizedDescription)")
            dato = nil
            vista.imgFoto.image = UIImage(named: "disco")
        }

        
             return vista
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:  IndexPath)    {
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Detalle Segue", sender: self)
    }
    
    @IBOutlet weak var entrar: UIButton!

}

