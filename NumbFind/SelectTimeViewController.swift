//
//  SelectTimeViewController.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 11.10.2023.
//

import UIKit

class SelectTimeViewController: UIViewController {

    var data:[Int] = []
    
    @IBOutlet weak var tableView: UITableView!
//    didSet {
//        tableView?.dataSource = self
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
        tableView.delegate = self

        
    }
   

}

extension SelectTimeViewController: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        cell.textLabel?.text = "\(String(data[indexPath.row])) seconds"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//
        Settings.share.currentSettings.timeForGame = data[indexPath.row]
        print (data[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
}
