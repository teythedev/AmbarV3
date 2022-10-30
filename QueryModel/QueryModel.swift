//
//  QueryModel.swift
//  AmbarAPI
//
//  Created by Tugay on 23.10.2022.
//

import Foundation

// MARK: - PostModel
struct QueryModel: Encodable {
    let structuredQuery: StructuredQuery
}

// MARK: - StructuredQuery
struct StructuredQuery: Encodable {
    private enum CodingKeys: String, CodingKey {
        case from
        case select
        case structuredQueryWhere = "where"
        case limit
    }
    let from: [From]
    let select: Select
    let structuredQueryWhere: Where
    let limit: Int
}

// MARK: - From
struct From: Encodable {
    let collectionId: String
}

// MARK: - Select
struct Select: Encodable {
    let fields: [Field]
}

// MARK: - Field
struct Field: Encodable {
    let fieldPath: String
}

// MARK: - Where
struct Where: Encodable {
    let compositeFilter: CompositeFilter
}

// MARK: - CompositeFilter
struct CompositeFilter: Encodable {
    let filters: [Filter]
    let op: String
}

// MARK: - Filter
struct Filter: Encodable {
    let fieldFilter: FieldFilter
}

// MARK: - FieldFilter
struct FieldFilter: Encodable {
    let field: Field
    let op: String
    let value: Value
}

// MARK: - Value
struct Value: Encodable{
    let stringValue: String?
   // let doubleValue: Double?
}
