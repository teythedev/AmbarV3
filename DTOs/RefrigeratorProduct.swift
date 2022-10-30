//
//  RefrigeratorProduct.swift
//  AmbarAPI
//
//  Created by Tugay on 21.10.2022.
//

import Foundation

public struct RefrigeratorProduct: Codable {
    
    public enum refrigeratorProductFieldConstants: String, CaseIterable {
        case kProductAmountType = "productAmountType"
        case kProductAmount = "productAmount"
        case kProductName = "productName"
        case kUserID = "userID"
        case kProductCellarID = "productCellarID"
        case kFbID = "fbID"
    }
    
    public let userID: String
    public let productName: String
    public let productAmountType: String
    public var productAmount: String
    public var productCellarID: String?
    public var fbID: String?
    
    public init(userID: String, productName: String, productAmountType: String, productAmount: String, productCellarID: String?, fbID: String?) {
        self.userID = userID
        self.productName = productName
        self.productAmountType = productAmountType
        self.productAmount = productAmount
        self.productCellarID = productCellarID
        self.fbID = fbID
    }
}
