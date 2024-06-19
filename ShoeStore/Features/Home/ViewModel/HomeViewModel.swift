//
//  HomeViewModel.swift
//  ShoeStore
//
//  Created by Felipe Assis on 18/6/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let repository: IHomeRepository
    //MARK: Banners
    @Published var viewState: ViewState = .initial
    @Published var banners: [Banner] = []
    
    init() {
        self.repository = HomeRepository()
    }
  
    func getBanners() async throws {
        self.viewState = .loading
        
        let result = try await repository.getHome()
        switch result {
        case .success(let response):
            if let banners = response {
                DispatchQueue.main.async {
                    self.banners = banners
                }
            }
            self.viewState = .success
        case .failure(let error):
            self.viewState = .error
            throw error
        }
    }
}


enum ViewState {
    case initial
    case loading
    case success
    case error
}
