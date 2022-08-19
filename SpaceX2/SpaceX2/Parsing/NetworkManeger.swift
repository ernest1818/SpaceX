//
//  NetworkManeger.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 18.08.2022.
//

import UIKit

class NetworkManeger {
    
    static func dounLoadImage(url: String, comlition: @escaping(_ image: UIImage)->()){
        
        guard let url = URL(string: url) else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, _, _ in
            if let data  = data , let image = [UIImage(data: data)].randomElement(){
                DispatchQueue.main.async {
                    comlition((image ?? UIImage(systemName: "folder")) ?? UIImage())
                }
            }
        }.resume()
    }
    
    
    static func fetchData(url: String, comlition: @escaping(_ rokets: [SpaceRocket])->()){
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let rokets = try decoder.decode([SpaceRocket].self, from: data)
                comlition(rokets)
            } catch {
            }
        }.resume()
    }
}
