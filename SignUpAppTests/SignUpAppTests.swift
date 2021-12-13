//
//  SignUpAppTests.swift
//  SignUpAppTests
//
//  Created by Alex Mochalov on 13/12/2021.
//

import XCTest
@testable import SignUpApp

class SignUpAppTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testApiCallSuccess() {
        let expectation = self.expectation(description: "We expect api call to return success")
        let repository = SignUpRepositoryImpl()
        repository.signup(email: "test@test.com", password: "1234567asd") { response in
            switch response {
            case .success(_):
                expectation.fulfill()
            case .error(let error):
                XCTFail("Failed sign up call with error \(error)")
            }
        }
        self.waitForExpectations(timeout: 10)
    }
    
    func testApiFail() {
        let expectation = self.expectation(description: "We expect that call will fail")
        let repository = SignUpRepositoryImpl()
        repository.signup(email: "test@error.com", password: "123asdasda") { response in
            switch response {
            case .success(_):
                XCTFail("Response should fail but it returned success")
            case .error(_):
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 10)
    }
    

}
