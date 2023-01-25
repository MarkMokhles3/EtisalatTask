//
//  Thumbnail.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation

// MARK: - Thumbnail

struct Thumbnail: Codable {

    enum Size: String {
        case small = "portrait_medium"
        case large = "landscape_incredible"
    }

    var path: String?
    var thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }

    func getURL(for size: Size) -> String {

        let thumbnailpath = path ?? ""
        let thumbnailExtension = thumbnailExtension ?? ""
        let imageURL = "\(thumbnailpath)/\(size.rawValue).\(thumbnailExtension)"

        return imageURL
    }
}

//// MARK: - URLElement
//
//struct URLElement: Codable {
//    var type: URLType?
//    var url: String?
//}
//
//enum URLType: String, Codable {
//    case comiclink = "comiclink"
//    case detail = "detail"
//    case wiki = "wiki"
//}
