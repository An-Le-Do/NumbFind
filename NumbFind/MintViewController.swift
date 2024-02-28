//
//  MintViewController.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 10.10.2023.
//

import UIKit

class MintViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    var textLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = textLabel
    }
    

    @IBAction func goToMain(_ sender: Any) {

//        performSegue(withIdentifier: "goToRed", sender: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func goToRedControl(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "redVC") as? RedViewController {
            vc.textLabel = "OK Red"
            vc.title = "RED"
            self.navigationController?.pushViewController(vc, animated: true) 
        }
       
    }
}
