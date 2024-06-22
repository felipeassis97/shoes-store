//
//  Address.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import Foundation

struct Address: Decodable {
    let street: String
    let neighboor: String
    let city: String
    let state: String
    let country: String
    let zipcode: String
    let lat: Double
    let lng: Double
}
