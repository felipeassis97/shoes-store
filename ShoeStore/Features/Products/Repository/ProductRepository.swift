//
//  ProductRepository.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import Foundation

import Core

struct ProductRepository: IProductRepository {
    private let client: IHttpClient
    
    init() {
        self.client = getClient()
    }
    
    func getProducts(storeID: String) async throws -> Result<[Product]?, RequestError> {
                let url = "https://private-4c27cb-shoes.apiary-mock.com/items"
                let response = try await client.get(path: url, header: nil, responseModel: [Product].self)
                return response
    }
}
