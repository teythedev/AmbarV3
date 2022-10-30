//
//  AuthUser.swift
//  AmbarAPI
//
//  Created by Tugay on 19.10.2022.
//

import Foundation

public struct AuthUser: Decodable {
    public enum CodingKeys: CodingKey {
        case kind
        case idToken
        case email
        case refreshToken
        case expiresIn
        case localId
    }
    public let kind: String
    public let idToken: String
    public let email: String
    public let refreshToken: String
    public let expiresIn: String
    public let localId: String
}
