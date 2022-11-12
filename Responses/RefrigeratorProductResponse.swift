//
//  RefrigeratorProductResponse.swift
//  AmbarAPI
//
//  Created by Tugay on 25.10.2022.
//

import Foundation

public struct RefrigeratorProductResponse: Decodable {
    public  let document: RefrigeratorProductDocument?
    public let readTime: String
    
    enum CodingKeys: CodingKey {
        case document
        case readTime
    }
    
    public var refrigeratorProduct: RefrigeratorProduct?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.document = try container.decodeIfPresent(RefrigeratorProductDocument.self, forKey: .document)
        self.readTime = try container.decode(String.self, forKey: .readTime)
        
        if let document = document {
            refrigeratorProduct = RefrigeratorProduct(
                userID: document.fields.userID.stringValue,
                productName: document.fields.productName.stringValue,
                productAmountType: document.fields.productAmountType.stringValue,
                productAmount: document.fields.productAmount.stringValue,
                productCellarID: document.fields.productCelllarID?.stringValue,
                fbID: document.fbID)
        }
    }
}

// MARK: - Document
public struct RefrigeratorProductDocument: Decodable {
    public let name: String
    public let fields: RefrigeratorProductResponseFields
    public let createTime, updateTime: String
    enum CodingKeys: CodingKey {
        case name
        case fields
        case createTime
        case updateTime
    }
    public var fbID: String {
        return name.components(separatedBy: "/").last ?? ""
    }
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.fields = try container.decode(RefrigeratorProductResponseFields.self, forKey: .fields)
        self.createTime = try container.decode(String.self, forKey: .createTime)
        self.updateTime = try container.decode(String.self, forKey: .updateTime)
    }
}

// MARK: - Fields
public struct RefrigeratorProductResponseFields: Decodable {
    public let userID, productName, productAmountType : StringValue
    
    public let productAmount: StringValue
    
    public let productCelllarID: StringValue?
    
    public enum CodingKeys: CodingKey {
        case userID
        case productName
        case productAmountType
        case productAmount
        case productCelllarID
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userID = try container.decode(StringValue.self, forKey: .userID)
        self.productName = try container.decode(StringValue.self, forKey: .productName)
        self.productAmountType = try container.decode(StringValue.self, forKey: .productAmountType)
        self.productAmount = try container.decode(StringValue.self, forKey: .productAmount)
        self.productCelllarID = try container.decodeIfPresent(StringValue.self, forKey: .productCelllarID)
    }
    
}

