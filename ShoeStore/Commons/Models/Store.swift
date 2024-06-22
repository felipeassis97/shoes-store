//
//  Establishment.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import Foundation

struct Store: Identifiable, Decodable {
    let id: String
    let name: String
    let description: String
    let brand: String
    let address: Address
}
