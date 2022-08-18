//
//  MYCollectionCell.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 17.08.2022.
//

import UIKit

class MYCollectionCell: UICollectionViewCell {
    var webSeriesImage: [String] = ["1","2","3","4"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var label: UILabel!
    
    
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
