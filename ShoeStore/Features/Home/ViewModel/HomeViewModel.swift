//
//  HomeViewModel.swift
//  ShoeStore
//
//  Created by Felipe Assis on 18/6/2024.
//

import Foundation

@Observable class HomeViewModel {
    //MARK: Attributes
    private let repository: IHomeRepository
    var banners: [Banner] = []
    var filters: [Filter] = []
    var stores: [Store] = []
    var currentFilter: Filter?
    var stateBanners: ViewState = .initial
    var stateFilters: ViewState = .initial
    var stateStores: ViewState = .initial
    
    //MARK: Constructor
    private init() {
        self.repository = HomeRepository()
    }
    static let instance = HomeViewModel()
    
    //MARK: Fetch banners
    func getBanners() async throws {
        self.stateBanners = .initial
        self.stateBanners = .loading
        
        let result = try await repository.getHome()
        switch result {
        case .success(let response):
            if let banners = response {
                DispatchQueue.main.async {
                    self.banners = banners
                }
            }
            self.stateBanners = .success
        case .failure(let error):
            self.stateBanners = .error
            throw error
        }
    }
    
    //MARK: Fetch filters
    func getFilters() async throws {
        self.stateFilters = .initial
        self.stateFilters = .loading
        
        let result = try await repository.getFilters()
        switch result {
        case .success(let response):
            if let filters = response {
                DispatchQueue.main.async {
                    self.filters = filters
                }
            }
            self.stateFilters = .success
        case .failure(let error):
            self.stateFilters = .error
            throw error
        }
    }
    
    //MARK: Fetch stores
    func getStores() async throws {
        self.stateStores = .initial
        self.stateStores = .loading
        
        let result = try await repository.getStores()
        switch result {
        case .success(let response):
            if let filters = response {
                DispatchQueue.main.async {
                    self.stores = filters
                }
            }
            self.stateStores = .success
        case .failure(let error):
            self.stateStores = .error
            throw error
        }
    }
}



