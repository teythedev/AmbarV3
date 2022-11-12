//
//  AuthUserResponse.swift
//  AmbarAPI
//
//  Created by Tugay on 19.10.2022.
//

import Foundation

public struct AuthUserResponse: Decodable {
    
    private enum CodingKeys: CodingKey {
    }
    
    
    public let authUser: User
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.authUser = try container.decode(User.self)
    }
}
