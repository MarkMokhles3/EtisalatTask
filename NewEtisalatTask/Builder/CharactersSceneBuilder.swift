//
//  CharactersSceneBuilder.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
// for create object

import UIKit

class CharactersSceneBuilder: CharactersSceneBuilderProtocol {
    
    func getCharactersViewController(router: CharactersRouterProtocol) -> UIViewController {
        let dataSource = CharactersAPIService()
        let viewModel = CharactersViewModel(dataSource: dataSource, router: router)
        let viewController = CharactersViewController(viewModel: viewModel)
        return viewController
    }
}
