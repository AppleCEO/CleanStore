//
//  CreateOrderInteractorTests.swift
//  CleanStore
//
//  Created by 도미닉 on 6/8/25.
//

import XCTest

final class CreateOrderInteractorTests: XCTestCase {
    var createOrderInteractor: CreateOrderInteractor!
    
    override func setUpWithError() throws {
        setupCreateOrderInteractor()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupCreateOrderInteractor() {
        createOrderInteractor = CreateOrderInteractor()
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
        createOrderInteractor = CreateOrderInteractor()
        
        // Given
        let createOrderPresentationLogicSpy = CreateOrderPresentationLogicSpy()
        createOrderInteractor.presenter = createOrderPresentationLogicSpy
        let request = CreateOrder.FormatExpirationDate.Request(date: Date())
        
        // When
        createOrderInteractor.formatExpirationDate(request: request)
        
        // Then
        XCTAssert(createOrderPresentationLogicSpy.presentExpirationDateCalled, "Formatting an expiration date should ask presenter to do it")
    }
    
    func testShippingMethodsShouldReturnAllAvailableShippingMethods() {
        createOrderInteractor = CreateOrderInteractor()
        
        // Given
        let allAvailableShippingMethods = [
            "Standard Shipping",
            "Two-Day Shipping ",
            "One-Day Shipping "
        ]
        
        // When
        let returnedShippingMethods = createOrderInteractor.shippingMethods
        
        // Then
        XCTAssertEqual(returnedShippingMethods, allAvailableShippingMethods, "Shipping Methods should list all available shipping methods")
    }
    
}
