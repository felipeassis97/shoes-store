//
//  HomeViewModel.swift
//  ShoeStore
//
//  Created by Felipe Assis on 18/6/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let repository: IHomeRepository
    @Published var banners: Banner?
    
    init() {
        self.repository = HomeRepository()
    }
  
    func getBanners() async throws {
        let result = try await repository.getHome()
        switch result {
        case .success(let response):
            DispatchQueue.main.async {
                self.banners = response
            }
        case .failure(let error):
            throw error
        }
    }
}
