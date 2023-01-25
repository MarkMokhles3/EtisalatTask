//
//  CharacteresAPIService.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation
import CryptoKit

class CharactersAPIService: CharactersAPIServiceProtocol {

    func getCharacters(query: String?, offset: Int, completion: @escaping(Result<APIResult,Error>) -> Void) {

        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")

        var components = URLComponents()
           components.scheme = "https"
           components.host = "gateway.marvel.com"
           components.port = 443
           components.path = "/v1/public/characters"
           components.queryItems = [
               URLQueryItem(name: "apikey", value: publicKey),
               URLQueryItem(name: "hash", value: hash),
               URLQueryItem(name: "ts", value: ts),
               URLQueryItem(name: "offset", value: "\(offset)")
           ]

        if let query, !query.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "nameStartsWith", value: query))
        }
        let url = components.url?.absoluteString ?? ""

        APIService.sharedService.request(url: url, completion: completion)
    }

    // MARK: - Cryption

    func MD5(data: String) -> String {

        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())

        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
}
