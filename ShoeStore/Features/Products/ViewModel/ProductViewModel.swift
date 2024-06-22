//
//  ProductViewModel.swift
//  ShoeStore
//
//  Created by Felipe Assis on 22/6/2024.
//

import Foundation

@Observable class ProductViewModel {
    //MARK: Attributes
    private let repository: IProductRepository
    var products: [Product] = []
    var stateProducts: ViewState = .initial
    
    //MARK: Constructor
    private init() {
        self.repository = ProductRepository()
    }
    static let instance = ProductViewModel()
    
    //MARK: Fetch products by store ID
    func getProducts() async throws {
        self.stateProducts = .initial
        self.stateProducts = .loading
        
        let result = try await repository.getProducts(storeID: "")
        switch result {
        case .success(let response):
            if let products = response {
                DispatchQueue.main.async {
                    self.products = products
                }
            }
            self.stateProducts = .success
        case .failure(let error):
            self.stateProducts = .error
            throw error
        }
    }
}
