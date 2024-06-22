//
//  IProductRepository.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import Foundation
import Core

protocol IProductRepository {
    func getProducts(storeID: String) async throws -> Result<[Product]?, RequestError>
}
