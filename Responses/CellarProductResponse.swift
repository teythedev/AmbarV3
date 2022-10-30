//
//  CellarProductsResponse.swift
//  AmbarAPI
//
//  Created by Tugay on 23.10.2022.
//

import Foundation

public struct CellarProductResponse: Decodable {
    public  let document: CellarProductDocument
    public let readTime: String
    
    enum CodingKeys: CodingKey {
        case document
        case readTime
    }
    
    public var cellarProduct: CellarProduct
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.document = try container.decode(CellarProductDocument.self, forKey: .document)
        self.readTime = try container.decode(String.self, forKey: .readTime)
        
        cellarProduct = CellarProduct(
            userID: document.fields.userID.stringValue,
            productName: document.fields.productName.stringValue,
            productAmountType: document.fields.productAmountType.stringValue,
            productAmount: document.fields.productAmount.stringValue,
            productRefrigeratorID: document.fields.productRefrigeratorID?.stringValue,
            fbID: document.fbID)
        
        
    }
}

// MARK: - Document
public struct CellarProductDocument: Decodable {
    public let name: String
    public let fields: CellarProductResponseFields
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
        self.fields = try container.decode(CellarProductResponseFields.self, forKey: .fields)
        self.createTime = try container.decode(String.self, forKey: .createTime)
        self.updateTime = try container.decode(String.self, forKey: .updateTime)
    }
}

// MARK: - Fields
public struct CellarProductResponseFields: Decodable {
    public let userID, productName, productAmountType : StringValue
    
    public let productAmount: StringValue
    
    public let productRefrigeratorID: StringValue?
    
    public enum CodingKeys: CodingKey {
        case userID
        case productName
        case productAmountType
        case productAmount
        case productRefrigeratorID
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userID = try container.decode(StringValue.self, forKey: .userID)
        self.productName = try container.decode(StringValue.self, forKey: .productName)
        self.productAmountType = try container.decode(StringValue.self, forKey: .productAmountType)
        self.productAmount = try container.decode(StringValue.self, forKey: .productAmount)
        self.productRefrigeratorID = try container.decodeIfPresent(StringValue.self, forKey: .productRefrigeratorID)
    }
    
}

// MARK: -
public struct StringValue: Decodable {
    public  let stringValue: String
    
    public init(stringValue: String) {
        self.stringValue = stringValue
    }
}
