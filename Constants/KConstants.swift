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
    
//    case DENEMEUSERIDTOKENSTRINGWITHBEARER = "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYW1iYXItYzE4YjUiLCJhdWQiOiJhbWJhci1jMThiNSIsImF1dGhfdGltZSI6MTY2Nzg4MTYxNCwidXNlcl9pZCI6IkRzTG13NThCN0dPRzFxdmlvS1ludlBPWk1aNzIiLCJzdWIiOiJEc0xtdzU4QjdHT0cxcXZpb0tZbnZQT1pNWjcyIiwiaWF0IjoxNjY3ODgxNjcyLCJleHAiOjE2Njc4ODUyNzIsImVtYWlsIjoiZGVuZW1lOUBkZW5lbWUuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbImRlbmVtZTlAZGVuZW1lLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.l_lcWdq0mm7YJL5Ld4yklqbiHnx-4XMkxVgTllUCX6EW41s4SNUGlb6thqaX19v1xlN45BrDOlNi7ZdZEbsxpfXxFg62mbUBZzNs16oi7jmIX-unoFTsHgbHIlBjuDTlgXicY7uSDl9_3SCGoleG_b32zW2jDCTysL3UDxVfEVfvvEjjJed3CUIRXtYblAt5Ay2lE67tR_n0znxSIgVAIcZj8PGYsbdMaBKeAyyOMetQE0PQAZJLFW2_81mx5hXCiz338wXsx0EgaNDPrMc3kHJYy58ZxpNPcDnye1VLL-JTC6k_6feSANAFGyVmhnRvgCgRkH9DxhnQ0DGN7TbOLw"
    
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
