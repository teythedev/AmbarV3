//
//  AmbarAPIService.swift
//  AmbarAPI
//
//  Created by Tugay on 17.10.2022.
//

import Foundation

public protocol AmbarApiServiceProtocol {
    func signUp(email: String, password: String, completion: @escaping (Result<AuthUserResponse, Error>) -> Void)
    func fetchDocs<T: Codable>(path: String, completion: @escaping (Result<T, Error>) -> Void)
    func fetchDocByID<T:Codable>(path: String, id: String, completion: @escaping (Result<T,Error>) -> Void)
    func post<T: Codable, R: Decodable>(body: T,path: String, completion: @escaping (Result<R,Error>) -> Void)
    func update<T: Codable, R: Decodable>(body: T,documentId: String ,path: String, fieldPathNames: [String] ,completion: @escaping (Result<R,Error>)-> Void)
    func makeQuery<T: Decodable>(collectionName: String, selectWith: String, fields: [String], filterWith: String, userID: String, limit: Int, completion: @escaping (Result<[T],Error>) -> Void)
}

public class AmbarApiService: AmbarApiServiceProtocol {
    
    
    
    public enum ApiError: Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init(){
        
    }
    
    public func signUp(email: String, password: String, completion: @escaping (Result<AuthUserResponse, Error>) -> Void) {
        let json: [String: Any] = ["email" : email, "password": password]
        let urlString = KConstants.kSignUpBaseURL.rawValue + AppSecrets.APIKEY.rawValue
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: json)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(AuthUserResponse.self, from: data)
                    completion(.success(response))
                }catch {
                    
                    completion(.failure(ApiError.serializationError(internal: error)))
                }
            }else {
                
                completion(.failure(ApiError.networkError(internal: error!)))
            }
        }
        task.resume()
    }
    
    
    public func fetchDocs<T: Codable>(path: String,completion: @escaping (Result<T, Error>) -> Void) {
        let urlString = KConstants.kDatabaseBaseURL.rawValue + path
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do{
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                }catch{
                    completion(.failure(error))
                }
            }else {
                completion(.failure(error!))
            }
        }
        task.resume()
    }
    
    public func fetchDocByID<T:Codable>(path: String, id: String, completion: @escaping (Result<T,Error>) -> Void) {
        let urlString = KConstants.kDatabaseBaseURL.rawValue + path + id + AppSecrets.ParametrizedAPIKEY.rawValue
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(ApiError.networkError(internal: error)))
            }else {
                guard let data = data else {
                    completion(.failure(ApiError.serializationError(internal:error!)))
                    return
                }
                let decoder = JSONDecoder()
                do{
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                }catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
    }
    
    public func post<T: Codable, R: Decodable>(body: T,path: String, completion: @escaping (Result<R,Error>) -> Void) {
        let urlString = KConstants.kDatabaseBaseURL.rawValue + path + AppSecrets.ParametrizedAPIKEY.rawValue
        let url = URL(string: urlString)!
        let encoder = JSONEncoder()
        let encodedBody = try? encoder.encode(body)
        guard let encodedBody = encodedBody else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encodedBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(ApiError.networkError(internal: error)))
            }else {
                guard let data = data else {
                    completion(.failure(ApiError.serializationError(internal:error!)))
                    return
                }
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(R.self, from: data)
                    completion(.success(result))
                }catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func update<T: Codable, R: Decodable>(body: T,documentId: String ,path: String, fieldPathNames: [String] ,completion: @escaping (Result<R,Error>)-> Void) {
        var fieldPathString = ""
        for fieldPathName in fieldPathNames {
            fieldPathString += "updateMask.fieldPaths=\(fieldPathName)&"
        }
        
        let urlString = KConstants.kDatabaseBaseURL.rawValue + path + "/\(documentId)?" + fieldPathString + "key=\(AppSecrets.APIKEY.rawValue)"
        let url = URL(string: urlString)!
        let encoder = JSONEncoder()
        let encodedBody = try? encoder.encode(body)
        guard let encodedBody = encodedBody else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encodedBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(ApiError.networkError(internal: error)))
            }else {
                guard let data = data else {
                    completion(.failure(ApiError.serializationError(internal:error!)))
                    return
                }
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(R.self, from: data)
                    completion(.success(result))
                }catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
        
    }
    
    
    public func makeQuery<T: Decodable>(collectionName: String, selectWith: String, fields: [String], filterWith: String, userID: String, limit: Int, completion: @escaping (Result<[T],Error>) -> Void) {
        
        var getFields : [Field] = []
        for field in fields {
            getFields.append(Field(fieldPath: field))
        }
        
        let urlString = KConstants.kQueryURL.rawValue + AppSecrets.ParametrizedAPIKEY.rawValue
        let url = URL(string: urlString)!
        let queryModel = QueryModel(
            structuredQuery: StructuredQuery(
                from: [From(collectionId: collectionName)],
                select: Select(fields: getFields),
                structuredQueryWhere:  Where(compositeFilter: CompositeFilter(filters: [Filter(fieldFilter: FieldFilter(field: Field(fieldPath: selectWith), op: "EQUAL", value: Value(stringValue: userID)))], op: "AND"))
                , limit: limit))
        let encoder = JSONEncoder()
        do {
            let queryBody = try encoder.encode(queryModel)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = queryBody
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(ApiError.networkError(internal: error)))
                }else {
                    guard let data = data else {
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode([T].self, from: data)
                        completion(.success(decodedData))
                    }catch {
                        completion(.failure(ApiError.serializationError(internal: error)))
                    }
                }
            }
            task.resume()
        }catch {}
        
        
    }
}
