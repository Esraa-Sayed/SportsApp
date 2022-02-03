//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by esraa on 2/3/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import XCTest
@testable import SportsApp
class SportsAppTests: XCTestCase {
    var sportApi = SportsAPi()
    var dataSource = EventDataSource()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testgetSports() {
       let expec = expectation(description: "waiting for API sport result")
        sportApi.getSports { [weak self](result) in
            switch result{
            case .success(let response):
                XCTAssertEqual(response?.sports.count, 31, "API Faild")
                expec.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
         waitForExpectations(timeout: 5, handler: nil)
    }
    
   
    
    

}
