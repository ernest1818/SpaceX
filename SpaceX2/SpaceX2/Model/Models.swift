//
//  Models.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 18.08.2022.
//

import Foundation

struct SpaceRocket: Decodable {
    let id: String
    let name: String
    let costPerLaunch: Int
    let firstFlight: String
    let firstStage: FirstStage
    let secondStage: SecondStage
    let country: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeights]
    let flickrImages: [String]
}

struct FirstStage: Decodable {
            let engines: Float?
            let fuelAmountTons: Float?
            let burnTimeSec: Float?
}
struct SecondStage: Decodable {
            let engines: Float?
            let fuelAmountTons: Float?
            let burnTimeSec: Float?
}

struct Height: Decodable {
    let meters: Float
    let feet: Float
}

struct Diameter: Decodable {
    let meters: Float
    let feet: Float
}

struct Mass: Decodable {
    let kg: Float
    let lb: Float
}

struct PayloadWeights: Decodable {
    let kg: Float?
    let lb: Float?
}


struct Launches: Decodable {
    let rocket: String
    let name: String
    let dateLocal: String
    let success: Bool?
}
