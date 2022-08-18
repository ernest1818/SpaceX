//
//  ViewController.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var webSeriesImage: [String] = ["1","2","3","4"]

    
    
//    var currentPage: Int = 0
    
    @IBOutlet weak var myPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        myPageControl.currentPage = 0
//        myPageControl.numberOfPages = webSeriesImage.count
        // Do any additional setup after loading the view.
    }
    
    


}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        webSeriesImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MYCollectionCell
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.imageView.image = UIImage(named: webSeriesImage[indexPath.row])
        cell.label.text = webSeriesImage[indexPath.row]
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        myPageControl.currentPage = indexPath.row - 1
        
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

