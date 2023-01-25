//
//  CharactersViewModelProtocol.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import Foundation

protocol CharactersViewModelProtocol {

    var charactersCount: Int { get }
    var onDataUpdate: (() -> Void)? { get set }

    func onSelect(index: Int)
    func searchFor(query: String)
    func getCellModel(for index: Int) -> Character
}

