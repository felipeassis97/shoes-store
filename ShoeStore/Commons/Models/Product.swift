//
//  StoreItem.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import Foundation

struct Product: Identifiable, Decodable {
    let id: String
    let brand: String
    let title: String
    let description: String
    let genre: String
    let price: Double
    let sizes: [ String ]
    let images: [ String ]
}
