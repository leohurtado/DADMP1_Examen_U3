//
//  opinionViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by LEONARDO on 05/04/17.
//  Copyright © 2017 LEONARDO. All rights reserved.
//

import UIKit

class opinionViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var ubicacion: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    var tnombre = ""
    var tdescripcion = ""
    var tubicacion = ""
    var timagen = ""
    
    var rateStar = ["star-e","star","star-e"]
    
    @IBAction func saveRate(sender: AnyObject) {
        
        rateStar = [button1.selected ? "star":"star-e",button2.selected ? "star":"star-e",button3.selected ? "star":"star-e"]
        
        performSegueWithIdentifier("viewBack", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ubicacion.text = tubicacion
        descripcion.text = tdescripcion
        nombre.text = tnombre
        imagen.image = UIImage(named: timagen)
        
        button1.setBackgroundImage(UIImage(named: "star"), forState: .Selected)
        button2.setBackgroundImage(UIImage(named: "star"), forState: .Selected)
        button3.setBackgroundImage(UIImage(named: "star"), forState: .Selected)
        
        
        button1.selected = rateStar[0]=="star"
        button2.selected = rateStar[1]=="star"
        button3.selected = rateStar[2]=="star"

        // Do any additional setup after loading the view.
    }

    
    @IBAction func star1(sender: AnyObject) {
        button1.selected=true;
        button2.selected=false;
        button3.selected=false;

    }
    
    @IBAction func star2(sender: AnyObject) {
        button1.selected=true;
        button2.selected=true;
        button3.selected=false;

    }
    
    @IBAction func star3(sender: AnyObject) {
        button1.selected=true;
        button2.selected=true;
        button3.selected=true;

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
