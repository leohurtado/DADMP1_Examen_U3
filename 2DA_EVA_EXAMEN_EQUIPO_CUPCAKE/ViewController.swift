//
//  ViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by LEONARDO on 05/04/17.
//  Copyright © 2017 LEONARDO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataEnteredDelegate{
        
    @IBOutlet weak var tableView: UITableView!
    
    var rowSelec = 0
    var eval = ""
    var nuevoRestaurant = false;
   
    
    var restaurants:[String : [String]]!
    var titulos: [String]!
    var screen_nuevo_restaurant = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ruta = obtenerRuta()
        print(ruta)
        if(NSFileManager.defaultManager().fileExistsAtPath(ruta.path!)){
            let diccionarioDatos = NSDictionary(contentsOfURL: ruta)
            restaurants = diccionarioDatos as! [String:[String]]
            titulos = (diccionarioDatos!.allKeys as! [String]).sort()
        }
        print(titulos.count)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnNuevoRestaurant(sender: AnyObject) {
        screen_nuevo_restaurant = true
        performSegueWithIdentifier("capturar", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let clave_nombre = titulos[0]
        return restaurants[clave_nombre]!.count
    }
    
    func obtenerRuta() -> NSURL {
        let tempDir = NSTemporaryDirectory()
        let tempDirURL = NSURL(fileURLWithPath: tempDir)
        let tempDirFile = tempDirURL.URLByAppendingPathComponent("restaurants.plist")
        return tempDirFile
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controlador = UIAlertController(title:"Tus datos",message: "funciona",preferredStyle: .Alert)
        let boton = UIAlertAction(title: "OK", style: .Default, handler: nil)
        controlador.addAction(boton)
        presentViewController(controlador, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let celda = tableView.dequeueReusableCellWithIdentifier("prime") as! primeTableViewCell
        //Falta asignar los datos del arreglo a la celda que se va a reutilizar
        
        
        let clave_nombre = titulos[3]
        let clave_descripcion = titulos[0]
        let clave_direccion = titulos[1]
        let clave_imagen = titulos[2]
        let clave_rate1 = titulos[4]
        let clave_rate2 = titulos[5]
        let clave_rate3 = titulos[6]
        celda.restaurantName.text = restaurants[clave_nombre]![indexPath.row]
        let imagen = UIImage(named: restaurants[clave_imagen]![indexPath.row])
        celda.restaurantImage.image = imagen
        
        celda.restaurantLocation.text = restaurants[clave_direccion]![indexPath.row]
        celda.restaurantDescription.text = restaurants[clave_descripcion]![indexPath.row]
        celda.starImage1.image = UIImage(named: restaurants[clave_rate1]![indexPath.row])
        celda.starImage2.image = UIImage(named: restaurants[clave_rate2]![indexPath.row])
        celda.starImage3.image = UIImage(named: restaurants[clave_rate3]![indexPath.row])

        return celda;

    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let compartirAct = UITableViewRowAction(style: .Default, title: "Compartir", handler: compartirRestaurant)
        compartirAct.backgroundColor = UIColor.darkGrayColor()
        //compCalifa[rowSelec] = rateRestaurant[rowSelec]
        let capturarAct = UITableViewRowAction(style: .Default, title: "Capturar", handler: capturarDatos)
        capturarAct.backgroundColor = UIColor.purpleColor()
        let opinionAct = UITableViewRowAction(style: .Default, title: "Opinion", handler:{action in self.performSegueWithIdentifier("opinion", sender: self)})
        opinionAct.backgroundColor = UIColor.cyanColor()
        let removerAct = UITableViewRowAction(style: .Default, title: "Eliminar", handler: removerRestaurant)
        removerAct.backgroundColor = UIColor.redColor()
        rowSelec = indexPath.row
        return [capturarAct,opinionAct,compartirAct,removerAct]
        
    }
    
    func removerRestaurant(action:UITableViewRowAction,indexPath:NSIndexPath) -> Void {
        let clave_nombre = titulos[3]
        let clave_descripcion = titulos[0]
        let clave_direccion = titulos[1]
        let clave_imagen = titulos[2]
        let clave_rate1 = titulos[4]
        let clave_rate2 = titulos[5]
        let clave_rate3 = titulos[6]
        
        restaurants[clave_nombre]!.removeAtIndex(rowSelec)
        restaurants[clave_descripcion]!.removeAtIndex(rowSelec)
        restaurants[clave_direccion]!.removeAtIndex(rowSelec)
        restaurants[clave_imagen]!.removeAtIndex(rowSelec)
        restaurants[clave_rate1]!.removeAtIndex(rowSelec)
        restaurants[clave_rate2]!.removeAtIndex(rowSelec)
        restaurants[clave_rate3]!.removeAtIndex(rowSelec)
        
        actualizarDatos(restaurants)
        
        tableView.reloadData()
        
    }
    
    func capturarDatos(action:UITableViewRowAction,indexPath:NSIndexPath) -> Void {
        screen_nuevo_restaurant = false
        performSegueWithIdentifier("capturar", sender: action)
    }

    func compartirRestaurant(action: UITableViewRowAction, indexPath: NSIndexPath) -> Void {
        
        //let miImagen = UIImage(named: imagenRestaurant[indexPath.row])
        
        
        //let miTexto = "Vine a comer en " + nombreRestaurant[indexPath.row] + " evaluado como " + ""
        //let actController = UIActivityViewController(activityItems: [miTexto, miImagen!, eval], applicationActivities: nil)
        //presentViewController(actController, animated: true, completion: nil)
        
    }
    /*func compartirRestaurant(action:UITableViewRowAction, indexPath:NSIndexPath) -> Void{
        let miImagen = UIImage(named: imagenRestaurant[indexPath.row])
        let miTexto = nombreRestaurant[rowSelec] + "evaluado como "
        let actController = UIActivityViewController(activityItems: [miTexto, miImagen!], applicationActivities: nil)
        presentViewController(actController, animated: true, completion: nil)
    }*/
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        let fuente = segue.sourceViewController as! editViewController
        
        print("Dando de alta")
        
        let clave_nombre = titulos[3]
        let clave_descripcion = titulos[0]
        let clave_direccion = titulos[1]
        let clave_imagen = titulos[2]
        let clave_rate1 = titulos[4]
        let clave_rate2 = titulos[5]
        let clave_rate3 = titulos[6]
        
        if screen_nuevo_restaurant {
            restaurants[clave_nombre]!.append(fuente.txtFldNombre.text!)
            restaurants[clave_descripcion]!.append(fuente.txtFldDesc.text!)
            restaurants[clave_direccion]!.append(fuente.txtFldDirec.text!)
            restaurants[clave_imagen]!.append(fuente.imgButton)
            restaurants[clave_rate1]!.append("star-e")
            restaurants[clave_rate2]!.append("star-e")
            restaurants[clave_rate3]!.append("star-e")
            
        }else {
            restaurants[clave_nombre]![rowSelec] = fuente.txtFldNombre.text!
            restaurants[clave_descripcion]![rowSelec] = fuente.txtFldDesc.text!
            restaurants[clave_direccion]![rowSelec] = fuente.txtFldDirec.text!
            restaurants[clave_imagen]![rowSelec] = fuente.imgButton
            screen_nuevo_restaurant = false

        }
        
        screen_nuevo_restaurant = false
        actualizarDatos(restaurants)
        
    }
    @IBAction func unWindToViewControllerFromOpinion(segue: UIStoryboardSegue) {
        let fuente = segue.sourceViewController as! opinionViewController
    
        let clave_rate1 = titulos[4]
        let clave_rate2 = titulos[5]
        let clave_rate3 = titulos[6]
        
        restaurants[clave_rate1]![rowSelec] = fuente.rateStar[0]
        restaurants[clave_rate2]![rowSelec] = fuente.rateStar[1]
        restaurants[clave_rate3]![rowSelec] = fuente.rateStar[2]
        
        print(fuente.rateStar)
        actualizarDatos(restaurants)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                print(screen_nuevo_restaurant)
        if screen_nuevo_restaurant {
            let secondViewController = segue.destinationViewController as! editViewController
            
            secondViewController.imgButton = "barrafina"
            return
        }
        
        if segue.identifier == "capturar" {
            let secondViewController = segue.destinationViewController as! editViewController
            
            let clave_nombre = titulos[3]
            let clave_descripcion = titulos[0]
            let clave_direccion = titulos[1]
            let clave_imagen = titulos[2]
            
            secondViewController.fldTxtNom = restaurants[clave_nombre]![rowSelec]
            secondViewController.imgButton = restaurants[clave_imagen]![rowSelec]
            
            secondViewController.fldtxtDirec  = restaurants[clave_direccion]![rowSelec]
            secondViewController.fldtxtDesc = restaurants[clave_descripcion]![rowSelec]
            
        }
        else if segue.identifier == "opinion" {
            let destino = segue.destinationViewController as! opinionViewController
            
            
            let clave_nombre = titulos[3]
            let clave_descripcion = titulos[0]
            let clave_direccion = titulos[1]
            let clave_imagen = titulos[2]
            let clave_rate1 = titulos[4]
            let clave_rate2 = titulos[5]
            let clave_rate3 = titulos[6]
            
            destino.rateStar = [restaurants[clave_rate1]![rowSelec],restaurants[clave_rate2]![rowSelec],restaurants[clave_rate3]![rowSelec]]
            destino.timagen = restaurants[clave_imagen]![rowSelec]
            destino.tnombre = restaurants[clave_nombre]![rowSelec]
            destino.tdescripcion = restaurants[clave_descripcion]![rowSelec]
            destino.tubicacion = restaurants[clave_direccion]![rowSelec]
            
            
        }
    }
    
    func userDidEnterInformation(info: String, descInfo: String, direcInfo: String, informacion:String) {
        
        let clave = titulos[rowSelec]
        restaurants[clave]![0] = info
        restaurants[clave]![1] = descInfo
        restaurants[clave]![2] = direcInfo
        restaurants[clave]![3] = informacion
        
        actualizarDatos(restaurants)
        
    }
    
    func actualizarDatos(restaurants:[String:[String]]) -> Void {
        let ruta = obtenerRuta()

        (restaurants as NSDictionary).writeToURL(ruta, atomically: true)
        
        tableView.reloadData()
    }
    
}

