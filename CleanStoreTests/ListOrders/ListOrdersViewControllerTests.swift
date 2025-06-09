//
//  ListOrdersViewControllerTests.swift
//  CleanStoreTests
//
//  Created by 도미닉 on 6/9/25.
//

import XCTest

final class ListOrdersViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    class ListOrdersDisplayLogicSpy: ListOrdersDisplayLogic {
        // MARK: Method call expectations
        var fetchOrdersCalled = false
        
        // MARK: Spied methods
        func fetchOrders(request: ListOrders.FetchOrders.Request)
        {
            fetchOrdersCalled = true
        }
    }

}
