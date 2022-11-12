//
//  KConstants.swift
//  AmbarAPI
//
//  Created by Tugay on 18.10.2022.
//

import Foundation

enum KConstants: String {
    case kDatabaseBaseURL =  "https://firestore.googleapis.com/v1/projects/ambar-c18b5/databases/(default)/documents/"
    case kSignUpBaseURL = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key="
    case kSignInBaseURL = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="
    case kRefreshTokenBaseURL = "https://securetoken.googleapis.com/v1/token?key="
    case kPosts = "Posts"
    case kQueryURL = "https://firestore.googleapis.com/v1/projects/ambar-c18b5/databases/(default)/documents:runQuery"

    
    case kStringValue = "stringValue"
    case kdoubleValue = "doubleValue"
    case kBooleanValue = "booleanValue"
}

public enum KFirebaseDataType: String {
case kStringValue = "stringValue"
case kdoubleValue = "doubleValue"
case kBooleanValue = "booleanValue"
}

//struct KConstants {
//    static let kBaseAPIURL = "https://firestore.googleapis.com/v1/projects/ambar-c18b5/databases/(default)/documents/"
//    static enum KCollectionNames: String {
//        case Posts = "Posts"
//        
//    }
//}
