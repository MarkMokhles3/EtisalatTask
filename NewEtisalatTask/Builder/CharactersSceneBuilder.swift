//
//  CharactersSceneBuilder.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//  For create object

import UIKit

class CharactersSceneBuilder: CharactersSceneBuilderProtocol {

    func getCharactersViewController(router: CharactersRouterProtocol) -> UIViewController {
        let dataSource = CharactersAPIService()
        let viewModel = CharactersViewModel(dataSource: dataSource, router: router)
        let viewController = CharactersViewController(viewModel: viewModel)
        return viewController
    }

    func getCharactersDetailsViewController(character: Character) -> UIViewController {
        let viewModel = CharactersDetailsViewModel(character: character)
        let viewController = CharactersDetailsViewController(viewModel: viewModel)
        return viewController
    }
}
