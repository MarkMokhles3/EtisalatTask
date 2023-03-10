//
//  CharactersRouterProtocol.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import UIKit

protocol CharactersRouterProtocol {
    func getRootViewController() -> UINavigationController
    func routeToDetails(character: Character) 
}



