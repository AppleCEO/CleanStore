//
//  CreateOrderPresenterTests.swift
//  CleanStore
//
//  Created by 도미닉 on 6/8/25.
//

import XCTest

final class CreateOrderPresenterTests: XCTestCase {
    var createOrderPresenter: CreateOrderPresenter!
    
    override func setUpWithError() throws {
        setupCreateOrderPresenter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupCreateOrderPresenter() {
        createOrderPresenter = CreateOrderPresenter()
    }

    class CreateOrderDisplayLogicSpy: CreateOrderDisplayLogic {
        var displayExpirationDateCalled = false
        var formatExpirationDateViewModel: CreateOrder.FormatExpirationDate.ViewModel!
        
        func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel) {
            displayExpirationDateCalled = true
            self.formatExpirationDateViewModel = viewModel
        }
    }
    
    func testPresentExpirationDateShouldConvertDateToString()
    {
        // Given
        let createOrderDisplayLogicSpy = CreateOrderDisplayLogicSpy()
        createOrderPresenter.viewController = createOrderDisplayLogicSpy
        
        var dateComponents = DateComponents()
        dateComponents.year = 2007
        dateComponents.month = 6
        dateComponents.day = 29
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents) ?? Date()
        let response = CreateOrder.FormatExpirationDate.Response(date: date)
        
        // When
        createOrderPresenter.presentExpirationDate(response: response)
        
        // Then
        let returnedDate = createOrderDisplayLogicSpy.formatExpirationDateViewModel.date
        let expectedDate = "6/29/07"
        XCTAssertEqual(returnedDate, expectedDate, "Presenting an expiration date should convert date to string")
    }
    
    func testPresentExpirationDateShouldAskViewControllerToDisplayDateString() {
        // Given
        let createOrderDisplayLogicSpy = CreateOrderDisplayLogicSpy()
        createOrderPresenter.viewController = createOrderDisplayLogicSpy
        let response = CreateOrder.FormatExpirationDate.Response(date: Date())
        
        // When
        createOrderPresenter.presentExpirationDate(response: response)
        
        // Then
        XCTAssert(createOrderDisplayLogicSpy.displayExpirationDateCalled, "Presenting an expiration date should ask view controller to display date string")
    }
}
