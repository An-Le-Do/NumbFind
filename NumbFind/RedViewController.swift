//
//  RedViewController.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 10.10.2023.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var redLabel: UILabel!
    var textLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLabel.text = textLabel
    }
    
    @IBAction func goToYellow(_ sender: Any) {
//        self.navigationController?.popToRootViewController(animated: true)
        
        if let viewController = self.navigationController?.viewControllers {
            for vc in viewController {
                if vc is YellowViewController {
                    self.navigationController?.popToViewController(vc, animated: true)
                }
            }
        }
    }
    
}
