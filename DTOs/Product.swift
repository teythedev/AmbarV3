//
//  Product.swift
//  AmbarAPI
//
//  Created by Tugay on 17.10.2022.
//


//"name": "projects/ambar-c18b5/databases/(default)/documents/Products/uEJqPUGmuTvLpHsdOnTs",
//"fields": {
//"name": {
//"stringValue": "Tomato"
//}
//},
//"createTime": "2022-10-03T18:25:01.452814Z",
//"updateTime": "2022-10-05T19:33:58.413989Z"


import Foundation
//
//public struct Product: Codable {
//
//    public enum CodingKeys: String, CodingKey {
//        case productPath = "name"
//        case fields
//    }
//
//    public let productPath: String
//    public var id: String {
//        return productPath.components(separatedBy: "/").last ?? ""
//    }
//    public let fields: ProductField
//
//    public init(productPath: String, fields: ProductField) {
//        self.productPath = productPath
//        self.fields = fields
//    }
//
//
//}
//
//public struct ProductField: Codable {
//    public let name: [String: String]
//    public var productName: String {
//        return name["stringValue"] ?? "N/A"
//    }
//
//    public init(name: [String : String]) {
//        self.name = name
//    }
//}
public struct Product {
    let fbID: String
    let name: String
}
