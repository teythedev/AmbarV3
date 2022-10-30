//
//  FireBaseError.swift
//  AmbarAPI
//
//  Created by Tugay on 22.10.2022.
//

import Foundation

struct FireBaseError: Decodable {
    let code: Int
    let message: String
}


struct FireBaseErrorResponse: Decodable {
    private enum RootCodingKeys: String, CodingKey {
        case error
    }
    
    private let error: FireBaseError
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.error = try container.decode(FireBaseError.self, forKey: .error)
    }
}
