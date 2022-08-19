//
//  ViewController.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 17.08.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var segment1 = 0
    var segment2 = 0
    var segment3 = 0
    var segment4 = 0
    
    private var rokets = [SpaceRocket]()
    private let url = "https://api.spacexdata.com/v4/rockets"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var currentPage: Int = 0
    
    @IBOutlet weak var myPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetData()
        myPageControl.currentPage = 0
        myPageControl.numberOfPages = 4
    }
    
    private func fetData(){
        NetworkManeger.fetchData(url: self.url) { (rokets) in
            self.rokets = rokets
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    @IBAction func sendTranaction( _ unwindSegue: UIStoryboardSegue){
        guard let settingVC = unwindSegue.source as? SettingsViewController else {return}
        segment1 = settingVC.segment1
        segment2 = settingVC.segment2
        segment3 = settingVC.segment3
        segment4 = settingVC.segment4
        collectionView.reloadData()
    }
    
    private func configerateCell(cell: MYCollectionCell, indexPath: IndexPath){
        let rokets = rokets[indexPath.row]
        
        DispatchQueue.global().async {
            guard let imagesUrl = URL(string: rokets.flickrImages.randomElement() ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imagesUrl) else {return}
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: imageData)
            }
        }
        
        cell.viewInScroll1.layer.cornerRadius = 40
        cell.viewInScroll1.layer.masksToBounds = true
        cell.viewInScroll2.layer.cornerRadius = 40
        cell.viewInScroll2.layer.masksToBounds = true
        cell.viewInScroll3.layer.cornerRadius = 40
        cell.viewInScroll3.layer.masksToBounds = true
        cell.viewInScroll4.layer.cornerRadius = 40
        cell.viewInScroll4.layer.masksToBounds = true
        
        cell.nameLabel.text = rokets.name
        cell.firstFlightLabel.text = rokets.firstFlight
        cell.countryLabel.text = rokets.country
        cell.costPerLaunchLabel.text = String("$\(rokets.costPerLaunch / 1000000) ml.")
        //FistStage
        cell.enginsCountLabel.text = "\(Int(rokets.firstStage.engines ?? 0.0))"
        cell.fuelAmountLabel.text = "\(rokets.firstStage.fuelAmountTons ?? 0.0)"
        cell.burnLabel.text = "\(Int(rokets.firstStage.burnTimeSec ?? 0.0))"
        //SecondStage
        cell.secondEngines.text = "\(Int(rokets.secondStage.engines ?? 0.0))"
        cell.secontFuelAmountLabel.text = "\(rokets.secondStage.fuelAmountTons ?? 0.0)"
        cell.secondBurnLabel.text = "\(Int(rokets.secondStage.burnTimeSec ?? 0.0))"
        
        if segment1 == 0 {
            cell.heightLabelCount.text = "\(rokets.height.meters)"
            cell.heightLabel.text = "Высота, m"
        } else {
            cell.heightLabelCount.text = "\(rokets.height.feet)"
            cell.heightLabel.text = "Высота, ft"
        }
        
        if segment2 == 0 {
            cell.diameterLabelCount.text = "\(rokets.diameter.meters)"
            cell.diametrLabel.text = "Диаметр, m"
        } else {
            cell.diameterLabelCount.text = "\(rokets.diameter.feet)"
            cell.diametrLabel.text = "Диаметр, ft"
        }
        
        if segment3 == 0 {
            cell.massLabelCount.text = "\(Int(rokets.mass.kg))"
            if cell.massLabelCount.text?.count == 5 {
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 2))
            } else if cell.massLabelCount.text?.count == 6 {
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 3))
            } else if cell.massLabelCount.text?.count == 7 {
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 1))
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 5))
            }
            cell.massLabel.text = "Масса, kg"
        } else {
            cell.massLabelCount.text = "\(Int(rokets.mass.lb))"
            if cell.massLabelCount.text?.count == 5 {
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 2))
            } else if cell.massLabelCount.text?.count == 6 {
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 3))
            } else if cell.massLabelCount.text?.count == 7 {
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 1))
                cell.massLabelCount.text?.insert(",", at: cell.massLabelCount.text!.index(cell.massLabelCount.text!.startIndex, offsetBy: 5))
            }
            cell.massLabel.text = "Масса, lb"
        }
        
        if segment4 == 0 {
            cell.payloadWeightLabelCount.text = "\(Int(rokets.payloadWeights[0].kg ?? 0))"
            
            if cell.payloadWeightLabelCount.text?.count == 5 {
                cell.payloadWeightLabelCount.text?.insert(",", at: cell.payloadWeightLabelCount.text!.index(cell.payloadWeightLabelCount.text!.startIndex, offsetBy: 2))
            } else if cell.payloadWeightLabelCount.text?.count == 6 {
                cell.payloadWeightLabelCount.text?.insert(",", at: cell.payloadWeightLabelCount.text!.index(cell.payloadWeightLabelCount.text!.startIndex, offsetBy: 3))
            }
            cell.payLoadLabel.text = "Нагрузка, kg"
        } else {
            cell.payloadWeightLabelCount.text = "\(Int(rokets.payloadWeights[0].lb ?? 0))"
            cell.payLoadLabel.text = "Нагрузка, lb"
            if cell.payloadWeightLabelCount.text?.count == 5 {
                cell.payloadWeightLabelCount.text?.insert(",", at: cell.payloadWeightLabelCount.text!.index(cell.payloadWeightLabelCount.text!.startIndex, offsetBy: 2))
            } else if cell.payloadWeightLabelCount.text?.count == 6 {
                cell.payloadWeightLabelCount.text?.insert(",", at: cell.payloadWeightLabelCount.text!.index(cell.payloadWeightLabelCount.text!.startIndex, offsetBy: 3))
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rokets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MYCollectionCell else {return UICollectionViewCell()}
        
        cell.ContentView.layer.cornerRadius = 40
        cell.ContentView.layer.masksToBounds = true
        configerateCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPageControl.currentPage = indexPath.row
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

