//
//  CellarsProductRequest.swift
//  AmbarAPI
//
//  Created by Tugay on 24.10.2022.
//

import Foundation
public struct CellarsProductRequest: Codable {
    let name: String
    let fields: CellarsProductRequestFields
    
    public init(cellarProduct: CellarProduct){
        
        self.name = ""
        self.fields = CellarsProductRequestFields(
            productName: CellarsProductStringValue(stringValue: cellarProduct.productName),
            productAmount: CellarsProductStringValue(stringValue: cellarProduct.productAmount),
            productAmountType: CellarsProductStringValue(stringValue: cellarProduct.productAmountType),
            productRefrigeratorID: CellarsProductStringValue(stringValue: cellarProduct.productRefrigeratorID ?? ""),
            userID: CellarsProductStringValue(stringValue: cellarProduct.userID))
    }
}

// MARK: - Fields
public struct CellarsProductRequestFields: Codable {
    let productName: CellarsProductStringValue
    let productAmount: CellarsProductStringValue
    let productAmountType: CellarsProductStringValue
    let productRefrigeratorID: CellarsProductStringValue?
    let userID: CellarsProductStringValue
}

// MARK: - ProductName
public struct CellarsProductStringValue: Codable {
    let stringValue: String
}

