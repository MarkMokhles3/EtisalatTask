//
//  CharactersDetailsViewModel.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation


class CharactersDetailsViewModel: CharactersDetailsViewModelProtocol {

    // MARK: - private iVars

    private var character: Character?

    // MARK: -  iVars

    var image: String? {
        character?.thumbnail?.getURL(for: .large)
    }
    var name: String? {
        character?.name
    }
    var description: String? {
        character?.description
    }

    init(character: Character) {
        self.character = character
    }

}
