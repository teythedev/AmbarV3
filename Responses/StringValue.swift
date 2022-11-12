//
//  StringValue.swift
//  AmbarAPI
//
//  Created by Tugay on 4.11.2022.
//

import Foundation

public struct StringValue: Decodable {
    public let stringValue: String
    
    public init(stringValue: String) {
        self.stringValue = stringValue
    }
}
