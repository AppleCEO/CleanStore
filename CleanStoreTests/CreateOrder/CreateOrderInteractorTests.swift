//
//  CreateOrderInteractorTests.swift
//  CleanStore
//
//  Created by 도미닉 on 6/8/25.
//

import XCTest

final class CreateOrderInteractorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Test doubles

    class CreateOrderPresentationLogicSpy: CreateOrderPresentationLogic
    {
        var presentExpirationDateCalled = false
        
        func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response) {
            presentExpirationDateCalled = true
        }
    }

    func testFormatExpirationDateShouldAskPresenterToFormatExpirationDate() {
        let createOrderInteractor = CreateOrderInteractor()
        
        // Given
        let createOrderPresentationLogicSpy = CreateOrderPresentationLogicSpy()
        createOrderInteractor.presenter = createOrderPresentationLogicSpy
        let request = CreateOrder.FormatExpirationDate.Request(date: Date())
        
        // When
        createOrderInteractor.formatExpirationDate(request: request)
        
        // Then
        XCTAssert(createOrderPresentationLogicSpy.presentExpirationDateCalled, "Formatting an expiration date should ask presenter to do it")
    }
    
}
