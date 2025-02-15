//
//  ListOfGiveawaysViewModelTests.swift
//  GameGiveawaysTests
//
//  Created by ali alaa on 15/02/2025.
//

import XCTest
import Combine
import Domain
@testable import GameGiveaways

final class ListOfGiveawaysViewModelTests: XCTestCase {
    // MARK: - Properties
    var viewModel: ListOfGiveawaysViewModel!
    var mockUseCase: MockListOfGiveawaysUseCase!
    var mockAction: MockListOfGiveawaysAction!
    var cancellable: Set<AnyCancellable>!

    // MARK: - Setups and Tear downs
    override func setUp() {
        super.setUp()
        mockAction = MockListOfGiveawaysAction()
        cancellable = []
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        mockAction = nil
        cancellable = nil
        super.tearDown()
    }

    // MARK: - getListOfGiveaways
    func test_ListOfGiveawaysViewModel_WhenGetListOfGiveawaysReturnResponseWithSuccess() async {
        // Given
        let expectedGiveaways = [
            Giveaway(
                id: 1,
                title: "Test Giveaway",
                description: "desription",
                platforms: "iOS",
                image: "001.jpg",
                users: 120,
                type: "",
                endDate: "15-02-2025",
                worth: "N/A"
            )
        ]
        mockUseCase = MockListOfGiveawaysUseCase(giveResult: .success(expectedGiveaways))
        viewModel = ListOfGiveawaysViewModel(
            listOfGiveawaysUseCase: mockUseCase,
            listOfGiveawaysAction: mockAction
        )
        
        // When
        viewModel.getListOfGiveaways()

        /// Wait for async task to complete
        let expectation = XCTestExpectation(description: "Fetch giveaways")
        viewModel.$giveaways
            .sink { giveaways in
                expectation.fulfill()
            }
            .store(in: &cancellable)

        await fulfillment(of: [expectation], timeout: 2)

        // Then
        XCTAssertEqual(viewModel.giveaways, expectedGiveaways)
        XCTAssertFalse(viewModel.shouldShowError)
        XCTAssertNil(viewModel.errorMessage)
    }

    func test_ListOfGiveawaysViewModel_WhenGetListOfGiveawaysReturnsWithError() async {
        // Given
        let expectedErrorMessage = NSError(domain: "TestError", code: -1, userInfo: nil)
        mockUseCase = MockListOfGiveawaysUseCase(giveResult: .failure(expectedErrorMessage))
        viewModel = ListOfGiveawaysViewModel(
            listOfGiveawaysUseCase: mockUseCase,
            listOfGiveawaysAction: mockAction
        )
        
        // When
        viewModel.getListOfGiveaways()
        /// Wait for async task to complete
        let expectation = XCTestExpectation(description: "Fetch giveaways error")
        viewModel.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                if errorMessage != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellable)
        
        await fulfillment(of: [expectation], timeout: 2)
        
        // Then
        XCTAssertTrue(viewModel.shouldShowError)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertNil(viewModel.giveaways)
    }

    // MARK: - Category Selection
    func testCategorySelection_RefreshData() {
        // Given
        let expectation = XCTestExpectation(description: "Refresh data for category selected")
        mockUseCase = MockListOfGiveawaysUseCase(giveResult: .success([]))
        viewModel = ListOfGiveawaysViewModel(
            listOfGiveawaysUseCase: mockUseCase,
            listOfGiveawaysAction: mockAction
        )
        
        viewModel.$giveaways
            .dropFirst()
            .sink { giveaways in
                expectation.fulfill()
            }
            .store(in: &cancellable)

        // When
        viewModel.platformCategorySelected = .ios

        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(mockUseCase.executeCalled)
    }
}
