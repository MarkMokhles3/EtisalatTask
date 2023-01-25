//
//  NewEtisalatTaskTests.swift
//  NewEtisalatTaskTests
//
//  Created by Mark Mokhles on 25/01/2023.
//

import XCTest
@testable import NewEtisalatTask

final class NewEtisalatTaskTests: XCTestCase {

    private var sut: CharactersViewModel! // System underTest
    private var dataSource: CharactersAPIServiceMock!
    private var router: RouterMock!

    override func setUp() {
        super.setUp()
        dataSource = CharactersAPIServiceMock()
        router = RouterMock()
        sut = CharactersViewModel(dataSource: dataSource, router: router)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCharacterViewModel_whenCalledSelectedIndex_RouteToDetailsWithThisIndex() {
        // given
        let selectedIndex = 1
        // when
        sut.onSelect(index: selectedIndex)
        // then
        XCTAssertTrue(router.calledRouteToDetails)
    }
}
