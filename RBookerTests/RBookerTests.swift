//
//  RBookerTests.swift
//  RBookerTests
//
//  Created by 夏敏 on 19/12/2016.
//  Copyright © 2016 夏敏. All rights reserved.
//

import XCTest

@testable import RBooker

class RBookerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var data:String?
        let loginExpectation = expectation(description: "login_expectation")
        RBUserService.shareService.login(userName: "", passWord: "") { (result) in
            data = result
            loginExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(data)
        }
        
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
