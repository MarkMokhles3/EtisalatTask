//
//  Character.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation

// MARK: - Character

struct Character: Codable {
    var id: Int?
    var name, description: String?
    var thumbnail: Thumbnail?
    var urls: [URLElement]? // [[String:String]]

}


