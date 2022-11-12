//
//  User.swift
//  AmbarAPI
//
//  Created by Tugay on 21.10.2022.
//

import Foundation

public struct User: Codable, Equatable {
    public enum CodingKeys: String, CodingKey {
        case id = "localId"
        case email
        case idToken
        case refreshToken
    }
    public let id: String
    public let email: String
    public let idToken: String
    public let refreshToken: String
}

public struct RefreshedToken: Codable {
    public enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
        case idToken = "id_token"
        case userID = "user_id"
    }
    
    public let refreshToken: String
    public let idToken, userID: String
}
