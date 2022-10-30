//
//  AmbarAPITests.swift
//  AmbarAPITests
//
//  Created by Tugay on 17.10.2022.
//

import XCTest
@testable import AmbarAPI

final class AmbarAPITests: XCTestCase {
    
    private var service: MockAPI!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = MockAPI()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let bundle = Bundle(for: AmbarAPITests.self)
        let url = bundle.url(forResource: "product", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let product = try decoder.decode(Product.self, from: data)
        
        XCTAssertEqual(product.fields.productName, "Onion")
        XCTAssertEqual(product.id, "FD1k7Lt6os58Vp4zqFRL")
        
        service.fetch(path: KConstants.kPosts.rawValue) { (result: Result<ProductsResponse, Error>) in
            switch result {
            case .success(let data):
                print(data.documents.count)
                XCTAssertEqual(data.documents.count, 5)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

final class MockAPI: AmbarApiServiceProtocol {
    func signUp(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        //TODO
    }
    
    func fetch<T: Decodable>(path: String, completion: @escaping (Result<T, Error>) -> Void)  {
        let bundle = Bundle(for: AmbarAPITests.self)
        let url = bundle.url(forResource: "productapi", withExtension: "json")!
        let data = try? Data(contentsOf: url)
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(T.self, from: data!)
            completion(.success(response))
        }catch {
            completion(.failure(error))
        }
    }
    
    
    

}
