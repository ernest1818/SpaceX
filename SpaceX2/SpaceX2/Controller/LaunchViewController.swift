//
//  LaunchViewController.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 18.08.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension LaunchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "launch", for: indexPath) as! LaunchTableCell
        
        
        return cell
    }
    
    
}

extension LaunchViewController: UITableViewDelegate {
    
}
