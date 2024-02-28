//
//  YellowViewController.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 10.10.2023.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print ("will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print ("did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print ("will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print ("did disappear")
    }
    
    deinit{
        print ("deinit ")
    }
    
    @IBAction func goToMintController(_ sender: Any) {
        performSegue(withIdentifier: "goToMint", sender: "very good" )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier  {
        case "goToMint":
            
            if let mintVC = segue.destination as? MintViewController {
                if let string = sender as? String {
                    mintVC.textLabel = string
                }
//                mintVC.textLabel = "GOOD"
            }
        default:
            break
        }
    }
    
   

}
