//
//  CharactersRouter.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//  For presenting

import UIKit
import Foundation

class CharactersRouter: CharactersRouterProtocol {

    // MARK: - Private

    private var navigationController: UINavigationController?
    private let builder: CharactersSceneBuilderProtocol

    init(charactersSceneBuilder: CharactersSceneBuilderProtocol) {
        self.builder = charactersSceneBuilder
    }

    func getRootViewController() -> UINavigationController {
        let viewController = builder.getCharactersViewController(router: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        return navigationController
    }

    func routeToDetails(character: Character) {
        let viewController = builder.getCharactersDetailsViewController(character: character)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
