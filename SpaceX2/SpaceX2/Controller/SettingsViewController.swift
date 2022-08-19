//
//  SettingsViewController.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 18.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    var segment1 = 0
    var segment2 = 0
    var segment3 = 0
    var segment4 = 0
    var complition: ((Int)-> ())?
    
    
    @IBOutlet weak var heightSegment: UISegmentedControl!
    
    @IBOutlet weak var diametrSegment: UISegmentedControl!
    
    @IBOutlet weak var weightSegment: UISegmentedControl!
    
    @IBOutlet weak var payloadSegment: UISegmentedControl!
    
    let userDeafaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let segment1 = userDeafaults.object(forKey: "segment1"){
            heightSegment.selectedSegmentIndex = segment1 as? Int ?? 0
        }
        if let segment2 = userDeafaults.object(forKey: "segment2"){
            diametrSegment.selectedSegmentIndex = segment2 as? Int ?? 0
        }
        if let segment3 = userDeafaults.object(forKey: "segment3"){
            weightSegment.selectedSegmentIndex = segment3 as? Int ?? 0
        }
        if let segment4 = userDeafaults.object(forKey: "segment4"){
            payloadSegment.selectedSegmentIndex = segment4 as? Int ?? 0
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = heightSegment?.selectedSegmentIndex {
            segment1 = data
        }
        if let data = diametrSegment?.selectedSegmentIndex {
            segment2 = data
        }
        if let data = weightSegment?.selectedSegmentIndex {
            segment3 = data
        }
        if let data = payloadSegment?.selectedSegmentIndex {
            segment4 = data
        }
        
    }
    
    
    @IBAction func dissmissAction(_ sender: Any) {
        userDeafaults.set(heightSegment.selectedSegmentIndex, forKey: "segment1")
        userDeafaults.set(diametrSegment.selectedSegmentIndex, forKey: "segment2")
        userDeafaults.set(weightSegment.selectedSegmentIndex, forKey: "segment3")
        userDeafaults.set(payloadSegment.selectedSegmentIndex, forKey: "segment4")
    }
}
