//
//  HomeRepository.swift
//  ShoeStore
//
//  Created by Felipe Assis on 18/6/2024.
//

import Foundation
import Core

struct HomeRepository: IHomeRepository {
    private let client: IHttpClient

    init() {
        self.client = getClient()
    }
    
    func getHome() async throws -> Result<[Banner]?, RequestError> {
        let url = "https://private-4c27cb-shoes.apiary-mock.com/banners"
        let response = try await client.get(path: url, header: nil, responseModel: [Banner].self)
        return response
    }
    
    func getFilters() async throws -> Result<[Filter]?, RequestError> {
        let url = "https://private-4c27cb-shoes.apiary-mock.com/filters"
        let response = try await client.get(path: url, header: nil, responseModel: [Filter].self)
        return response
    }
    
    func getStores() async throws -> Result<[Store]?, RequestError> {
        let url = "https://private-4c27cb-shoes.apiary-mock.com/stores"
        let response = try await client.get(path: url, header: nil, responseModel: [Store].self)
        return response
    }
    
}





