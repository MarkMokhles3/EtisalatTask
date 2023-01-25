//
//  CharactersViewModel.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation

class CharactersViewModel: CharactersViewModelProtocol {

    init(dataSource: CharactersAPIServiceProtocol, router: CharactersRouterProtocol) {
        self.dataSource = dataSource
        self.router = router
        getCharacters()
    }

    // MARK: - Private iVars

    private var characters: [Character] = []
    private var dataSource: CharactersAPIServiceProtocol
    private var router: CharactersRouterProtocol
    private var query: String?
    private var isFetching: Bool = false

    // MARK: -  iVars

    var charactersCount: Int  {
        return characters.count
    }
    var paginationTrigerIndex: Int {
        return characters.count - 5
    }
    var onDataUpdate: (() -> Void)?

    // MARK: - Get CharactersList

    private func getCharacters() {

        isFetching = true

        dataSource.getRepositories(query: query, offset: charactersCount) { [weak self] result in

            switch result {
            case .success(let characters):
                self?.characters.append(contentsOf: characters.data?.results ?? [])
                self?.onDataUpdate?()

            case .failure(let error):
                print(error)
            }
            self?.isFetching = false
        }
    }

    func getCellModel(for index: Int) -> Character {
        defer {
            if !isFetching, index >= paginationTrigerIndex {
                getCharacters()
            }
        }
        return characters[index]
    }

    func onSelect(index: Int) {
        
    }

    func searchFor(query: String) {
        self.query = query
        characters.removeAll()
        getCharacters()
    }
}

