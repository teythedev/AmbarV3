//
//  RefrigeratorsProductRequest.swift
//  AmbarAPI
//
//  Created by Tugay on 25.10.2022.
//

import Foundation
public struct RefrigeratorProductRequest: Codable {
    let name: String
    public let fields: RefrigeratorProductRequestFields
    
    public init(refrigeratorProduct: RefrigeratorProduct){
        
        self.name = ""
        self.fields = RefrigeratorProductRequestFields(
            productName: RefrigeratorsProductStringValue(stringValue: refrigeratorProduct.productName),
            productAmount: RefrigeratorsProductStringValue(stringValue: refrigeratorProduct.productAmount),
            productAmountType: RefrigeratorsProductStringValue(stringValue: refrigeratorProduct.productAmountType),
            productCellarID: RefrigeratorsProductStringValue(stringValue: refrigeratorProduct.productCellarID ?? ""),
            userID: RefrigeratorsProductStringValue(stringValue: refrigeratorProduct.userID))
    }
}

// MARK: - Fields
public struct RefrigeratorProductRequestFields: Codable {
    let productName: RefrigeratorsProductStringValue
    let productAmount: RefrigeratorsProductStringValue
    let productAmountType: RefrigeratorsProductStringValue
    let productCellarID: RefrigeratorsProductStringValue?
    let userID: RefrigeratorsProductStringValue
}

// MARK: - ProductName
public struct RefrigeratorsProductStringValue: Codable {
    let stringValue: String
}
