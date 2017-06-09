//
//  imageViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by LEONARDO on 05/04/17.
//  Copyright © 2017 LEONARDO. All rights reserved.
//

import UIKit

class imageViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var imagenRestaurant = [
        "barrafina",
        "bourkestreetbakery",
        "cafedeadend",
        "cafeloisl",
        "cafelore",
        "confessional",
        "donostia",
        "fiveleaves",
        "forkeerestaurant",
        "grahamavenuemeats",
        "haighschocolate",
        "homei",
        "palominoespresso",
        "petiteoyster",
        "posatelier",
        "royaloak",
        "teakha",
        "thaicafe",
        "traif",
        "upstate",
        "wafflewolf",
        ]
    
    var imageSelected = "barrafina"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagenRestaurant.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        imageSelected = imagenRestaurant[indexPath.row]
        /*let controlador = UIAlertController(title:"Tus datos",message: "funciona",preferredStyle: .Alert)
        
        let boton = UIAlertAction(title: "OK", style: .Default, handler: nil)
        controlador.addAction(boton)
        presentViewController(controlador, animated: true, completion: nil)*/
        
        performSegueWithIdentifier("imageBack", sender: self)
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCellWithIdentifier("prime2") as! prime2TableViewCell
        //Falta asignar los datos del arreglo a la celda que se va a reutilizar
        
        let imagen = UIImage(named: imagenRestaurant[indexPath.row])
        celda.imagen.image = imagen
        return celda;
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
