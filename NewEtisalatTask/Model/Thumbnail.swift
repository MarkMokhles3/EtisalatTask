//
//  Thumbnail.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation

// MARK: - Thumbnail

struct Thumbnail: Codable {

    // MARK: - iVars

    var path: String?
    var thumbnailExtension: String?

    // MARK: - Enums

    enum Size: String {
        case small = "portrait_medium"
        case large = "landscape_incredible"
    }

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    // MARK: - iFunc

    func getURL(for size: Size) -> String {

        let thumbnailpath = path ?? ""
        let thumbnailExtension = thumbnailExtension ?? ""
        let imageURL = "\(thumbnailpath)/\(size.rawValue).\(thumbnailExtension)"

        return imageURL
    }
}
