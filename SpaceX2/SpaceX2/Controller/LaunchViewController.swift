//
//  LaunchViewController.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 18.08.2022.
//

import UIKit

struct Tag {
    var text: String
    
}

class LaunchViewController: UIViewController {
    
    var rocketName = ""
    var id = ""
    private var launches = [Launches]()
    private var launch = [Launches]()
    let url = "https://api.spacexdata.com/v4/launches"
    var selected: [Tag] = [Tag(text: "5e9d0d95eda69955f709d1eb")]
    private let imageTrue = UIImage(named: "rtrue")
    private let imageFalse = UIImage(named: "rfalse")
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        configirationNav()
       
    }
    
    private func configirationNav(){
        title = rocketName
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
     private func getFormattedDate(string: String , formatter:String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = formatter

        let date: Date? = dateFormatterGet.date(from: string)

        return dateFormatterPrint.string(from: date!);
    }
    
    
    
    private func fetch() {
        NetworkManeger.fetchData2(url: url) { rokets in
            self.selected[0].text = self.id
            self.launches = rokets
            let result = self.launches.filter { launches in
                self.selected.contains {$0.text == launches.rocket}
                
            }
            self.launch = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            print(result)
        }
    }
    
}

extension LaunchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "launch", for: indexPath) as! LaunchTableCell
        cell.cellView.layer.cornerRadius = 25
        cell.cellView.layer.masksToBounds = true
       
        let image = launch[indexPath.row].success
        let date = launch[indexPath.row].dateLocal
        
        
        let dataForm = DateFormatter()
        dataForm.dateStyle = .medium
        dataForm.timeStyle = .none
        dataForm.locale = Locale(identifier: "en_US")
        cell.launchNameLabel.font = UIFont(name: "LabGrotesque-Regular", size: 20)
        cell.launchNameLabel.text = launch[indexPath.row].name
        cell.launchDateLabel.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        cell.launchDateLabel.text = getFormattedDate(string: date, formatter: "dd MMMM,yyyy")              //"\(launch[indexPath.row].dateLocal)"
        if image == true {
            cell.launchImage.image = imageTrue
        } else {
            cell.launchImage.image = imageFalse
        }
        
        
        return cell
    }
    
    
}

extension LaunchViewController: UITableViewDelegate {
    
}
