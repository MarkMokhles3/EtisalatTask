//
//  CharactersAPIServiceProtocol.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation

protocol CharactersAPIServiceProtocol {
    func getRepositories(query: String, offset: Int, completion: @escaping(Result<APIResult,Error>) -> Void)
}
