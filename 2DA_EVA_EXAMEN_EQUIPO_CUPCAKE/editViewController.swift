//
//  editViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by LEONARDO on 05/04/17.
//  Copyright © 2017 LEONARDO. All rights reserved.
//

import UIKit

//protocolo usado para enviar informacion
protocol DataEnteredDelegate: class {
    func userDidEnterInformation(info: String, descInfo: String, direcInfo: String,informacion: String)
}

class editViewController: UIViewController ,DataEnteredDelegate{
    
    let imagenesRestaurant = ["barrafina", "bourkestreetbakery","cafedeadend", "cafeloisl", "cafelore", "confessional", "donostia", "fiveleaves", "forkeerestaurant", "grahamavenuemeats", "haighschocolate", "homei", "palominoespresso", "petiteoyster", "posatelier", "royaloak", "teakha", "thaicafe", "traif", "upstate", "wafflewolf"]
    
    @IBAction func sendTextBackButton(sender: AnyObject) {
        performSegueWithIdentifier("capturar_a_main", sender: self)
    }
    
    weak var delegate: DataEnteredDelegate? = nil
    
    @IBOutlet weak var txtFldNombre: UITextField!
    @IBOutlet weak var txtFldDesc: UITextField!
    @IBOutlet weak var txtFldDirec: UITextField!
    @IBOutlet weak var btnImg: UIButton!
    
    var fldTxtNom = ""
    var fldtxtDesc = ""
    var fldtxtDirec = ""
    var imgButton = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldNombre.text = fldTxtNom
        txtFldDesc.text = fldtxtDesc
        txtFldDirec.text = fldtxtDirec
        btnImg.setBackgroundImage(UIImage(named: imgButton), forState: .Normal)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindImageViewController(segue: UIStoryboardSegue) {
        let sourceView = segue.sourceViewController as! imageViewController
        
        let image = UIImage(named: sourceView.imageSelected)
        btnImg.setBackgroundImage(image, forState: .Normal)
        imgButton = sourceView.imageSelected
    }
    func userDidEnterInformation(info: String, descInfo: String, direcInfo: String,informacion:String) {
        
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //
//    }
//    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        //
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
