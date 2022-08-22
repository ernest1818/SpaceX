//
//  MYCollectionCell.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 17.08.2022.
//

import UIKit

class MYCollectionCell: UICollectionViewCell {
    var webSeriesImage: [String] = ["1","2","3","4"]
    
    
    
    @IBOutlet weak var viewInScroll1: UIView!
    @IBOutlet weak var viewInScroll2: UIView!
    @IBOutlet weak var viewInScroll3: UIView!
    @IBOutlet weak var viewInScroll4: UIView!
    
    //MARK: - height, dimeter, mass, payload_weight
    @IBOutlet weak var heightLabelCount: UILabel!
    @IBOutlet weak var diameterLabelCount: UILabel!
    @IBOutlet weak var massLabelCount: UILabel!
    @IBOutlet weak var payloadWeightLabelCount: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var diametrLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var payLoadLabel: UILabel!
    
    //Variables
    
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - FistFlight
    @IBOutlet weak var firstFlight: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var costPerLaunch: UILabel!
    @IBOutlet weak var firstFlightLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var costPerLaunchLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - FistStage
    @IBOutlet weak var enginesLabelFirstStage: UILabel!
    @IBOutlet weak var fuelAmountFirstStage: UILabel!
    @IBOutlet weak var burnFirstStage: UILabel!
    @IBOutlet weak var enginsCountLabel: UILabel!
    @IBOutlet weak var fuelAmountLabel: UILabel!
    @IBOutlet weak var burnLabel: UILabel!
    
    //MARK: - SecondStage
    @IBOutlet weak var enginesLabelSecondStage: UILabel!
    @IBOutlet weak var secondEngines: UILabel!
    @IBOutlet weak var burnSecondStage: UILabel!
    @IBOutlet weak var fuelAmountSecondStage: UILabel!
    @IBOutlet weak var secontFuelAmountLabel: UILabel!
    @IBOutlet weak var secondBurnLabel: UILabel!

    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    
        
    }
    
    
}
extension MYCollectionCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath) as? MyTableCell else { fatalError() }
        
        return cell
    }
    
    
    
}
