//
//  APIResult.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation

// MARK: - APIResult

struct APIResult: Codable {
    var data: APIChracterData?
}

// MARK: - APIChracterData

struct APIChracterData: Codable {
    var total: Int?
    var count: Int?
    var results: [Character]
}
