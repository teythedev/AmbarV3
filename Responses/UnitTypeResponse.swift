//
//  UnitTypeResponse.swift
//  AmbarAPI
//
//  Created by Tugay on 2.11.2022.
//

import Foundation


// MARK: - ProductsResponse
public struct UnitTypesResponse: Codable {
    public let documents: [UnitTypeDocument]
    enum CodingKeys: CodingKey {
        case documents
    }
    public var unitTypes: [UnitType]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.documents = try container.decode([UnitTypeDocument].self, forKey: .documents)
        unitTypes = [UnitType]()
        for document in documents {
            unitTypes.append(UnitType(fbID: document.fbID, type: document.fields.type.stringValue))
        }
    }
}

// MARK: - Document
public struct UnitTypeDocument: Codable {
    let name: String
    let fields: UnitTypeFields
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
        self.fields = try container.decode(UnitTypeFields.self, forKey: .fields)
        self.createTime = try container.decode(String.self, forKey: .createTime)
        self.updateTime = try container.decode(String.self, forKey: .updateTime)
    }
    
}

// MARK: - Fields
public struct UnitTypeFields: Codable {
    let type: UnitTypeType
    enum CodingKeys: CodingKey {
        case type
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(UnitTypeType.self, forKey: .type)
    }
}

// MARK: - Name
public struct UnitTypeType: Codable {
    let stringValue: String
    enum CodingKeys: CodingKey {
        case stringValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.stringValue = try container.decode(String.self, forKey: .stringValue)
    }
}
