//
//  CreateOrderModels.swift
//  CleanStore
//
//  Created by 도미닉 on 6/12/25.
//  Copyright (c) 2025 Clean Swift LLC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum CreateOrder
{
    struct OrderFormFields
    {
      // MARK: Contact info
      var firstName: String
      var lastName: String
      var phone: String
      var email: String
      
      // MARK: Payment info
      var billingAddressStreet1: String
      var billingAddressStreet2: String
      var billingAddressCity: String
      var billingAddressState: String
      var billingAddressZIP: String
      
      var paymentMethodCreditCardNumber: String
      var paymentMethodCVV: String
      var paymentMethodExpirationDate: Date
      var paymentMethodExpirationDateString: String
      
      // MARK: Shipping info
      var shipmentAddressStreet1: String
      var shipmentAddressStreet2: String
      var shipmentAddressCity: String
      var shipmentAddressState: String
      var shipmentAddressZIP: String
      
      var shipmentMethodSpeed: Int
      var shipmentMethodSpeedString: String
      
      // MARK: Misc
      var id: String?
      var date: Date
      var total: NSDecimalNumber
    }
    
    // MARK: Use cases
    
    enum FormatExpirationDate
    {
        struct Request
        {
            var date: Date
        }
        struct Response
        {
            var date: Date
        }
        struct ViewModel
        {
            var date: String
        }
    }
    
    enum EditOrder
    {
        struct Request
        {
        }
        struct Response
        {
            var order: Order
        }
        struct ViewModel
        {
            var orderFormFields: OrderFormFields
        }
    }
    
    enum CreateOrder
    {
        struct Request
        {
            var orderFormFields: OrderFormFields
        }
        struct Response
        {
            var order: Order?
        }
        struct ViewModel
        {
            var order: Order?
        }
    }
    
    enum UpdateOrder
    {
        struct Request
        {
            var orderFormFields: OrderFormFields
        }
        struct Response
        {
            var order: Order?
        }
        struct ViewModel
        {
            var order: Order?
        }
    }
}
