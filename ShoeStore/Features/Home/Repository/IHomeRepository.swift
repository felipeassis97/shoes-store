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
}
