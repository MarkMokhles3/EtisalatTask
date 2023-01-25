//
//  RouterMock.swift
//  NewEtisalatTaskTests
//
//  Created by Mark Mokhles on 25/01/2023.
//

import UIKit
import Foundation
@testable import NewEtisalatTask

class RouterMock: CharactersRouterProtocol {

    var calledRouteToDetails = false
    func routeToDetails(character: NewEtisalatTask.Character) {
        calledRouteToDetails = true
    }
    
    func getRootViewController() -> UINavigationController {
        return UINavigationController()
    }
}
