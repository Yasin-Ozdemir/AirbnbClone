//
//  ExpoloreService.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 7.02.2025.
//

import Foundation

class ExpoloreService {
    func fetchListings() async throws -> [Listing] {
         DeveloperPreview.shared.listings
    }
}
