//
//  CharactersAPIServiceMock.swift
//  NewEtisalatTaskTests
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation
@testable import NewEtisalatTask

class CharactersAPIServiceMock: CharactersAPIServiceProtocol {

    var isFail = false

    func getCharacters(query: String?, offset: Int, completion: @escaping(Result<APIResult,Error>) -> Void) {
        if isFail {
            completion(.failure(MockError.apiFailure))
        } else {
            completion(.success(apiResult))
        }
    }
}

let apiResult: APIResult = APIResult(data: apiChracterData)

let apiChracterData: APIChracterData = APIChracterData(results: characters)

let characters: [Character] = [

    Character(name: "Iron Man", description: "Iron Man", thumbnail: Thumbnail(path: "image", thumbnailExtension: ".jpg")),
    Character(name: "Captian America", description: "Captian America", thumbnail: Thumbnail(path: "image1", thumbnailExtension: ".jpg")),
    Character(name: "Black Panther", description: "Black Panther", thumbnail: Thumbnail(path: "image", thumbnailExtension: ".jpg"))

]
