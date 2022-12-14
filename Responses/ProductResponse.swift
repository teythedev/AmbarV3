//
//  ProductResponse.swift
//  AmbarAPI
//
//  Created by Tugay on 17.10.2022.
//

import Foundation


// MARK: - ProductsResponse
public struct ProductsResponse: Codable {
    public let documents: [ProductDocument]
    enum CodingKeys: CodingKey {
        case documents
    }
    public var products: [Product]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.documents = try container.decode([ProductDocument].self, forKey: .documents)
        products = [Product]()
        for document in documents {
            products.append(Product(fbID: document.fbID, name: document.fields.name.stringValue))
        }
    }
}

// MARK: - Document
public struct ProductDocument: Codable {
    let name: String
    let fields: ProductFields
    let createTime, updateTime: String
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
        self.fields = try container.decode(ProductFields.self, forKey: .fields)
        self.createTime = try container.decode(String.self, forKey: .createTime)
        self.updateTime = try container.decode(String.self, forKey: .updateTime)
    }
    
}

// MARK: - Fields
public struct ProductFields: Codable {
    let name: ProductName
    enum CodingKeys: CodingKey {
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(ProductName.self, forKey: .name)
    }
}

// MARK: - Name
public struct ProductName: Codable {
    let stringValue: String
    enum CodingKeys: CodingKey {
        case stringValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.stringValue = try container.decode(String.self, forKey: .stringValue)
    }
}
