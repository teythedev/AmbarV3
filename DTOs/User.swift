//
//  User.swift
//  AmbarAPI
//
//  Created by Tugay on 21.10.2022.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let idToken: String
    let refreshToken: String
}
