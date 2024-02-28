//
//  OptionsTableViewController.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 11.10.2023.
//

import UIKit

class OptionsTableViewController: UITableViewController {
    
    @IBOutlet weak var switchTimer: UISwitch!
    @IBOutlet weak var timeGameLabel: UILabel!
    @IBOutlet weak var resetSett: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.share.currentSettings.timeState = sender.isOn
    }
    
    func loadSettings() {
        timeGameLabel.text = "\(Settings.share.currentSettings.timeForGame) sec"
        switchTimer.isOn = Settings.share.currentSettings.timeState
    }
    
    @IBAction func resetSettings(_ sender: Any) {
        Settings.share.resetSettings()
        loadSettings()
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "selectTimeVC":
            if let vc = segue.destination as? SelectTimeViewController {
                vc.data = [10,15,20,25,30,35,40]
            }
        default:
            break
        }
    }
}
