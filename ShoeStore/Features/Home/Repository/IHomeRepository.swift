//
//  IHomeRepository.swift
//  ShoeStore
//
//  Created by Felipe Assis on 18/6/2024.
//

import Foundation
import Core

protocol IHomeRepository {
    func getHome() async throws -> Result<[Banner]?, RequestError>
    func getFilters() async throws -> Result<[Filter]?, RequestError>
    func getStores() async throws -> Result<[Store]?, RequestError>
}
