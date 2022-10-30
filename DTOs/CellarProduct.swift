//
//  CellarProduct.swift
//  AmbarAPI
//
//  Created by Tugay on 21.10.2022.
//

import Foundation

public struct CellarProduct: Codable{
    
    public enum cellarProductFieldConstants: String, CaseIterable {
        case kProductAmountType = "productAmountType"
        case kProductAmount = "productAmount"
        case kProductName = "productName"
        case kUserID = "userID"
        case kProductRefrigeratorID = "productRefrigeratorID"
        case kFbID = "fbID"
    }
    
    public let userID: String
    public let productName: String
    public let productAmountType: String
    public var productAmount: String
    public var productRefrigeratorID: String?
    public let fbID: String
    
    public init(userID: String, productName: String, productAmountType: String, productAmount: String, productRefrigeratorID: String?, fbID: String) {
        self.userID = userID
        self.productName = productName
        self.productAmountType = productAmountType
        self.productAmount = productAmount
        self.productRefrigeratorID = productRefrigeratorID
        self.fbID = fbID
    }
}
