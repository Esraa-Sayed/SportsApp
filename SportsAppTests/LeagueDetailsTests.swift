//
//  LeagueDetailsTests.swift
//  SportsAppTests
//
//  Created by Mohamed Toba on 2/4/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import XCTest
@testable import SportsApp
class LeagueDetailsTests: XCTestCase {
    
    var dataSource = EventDataSource()
       override func setUp() {
           // Put setup code here. This method is called before the invocation of each test method in the class.
       }

       override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }
    func testgetEvents() {
          let expec = expectation(description: "waiting for API event result")
            dataSource.getEvents(id: "", complitionHandler: { (result,Error) in
               if result != nil {
                   XCTAssertEqual(result?.count, 1, "API Faild")
                                  expec.fulfill()
               }else{
                   XCTFail()
               }
               })
           waitForExpectations(timeout: 5, handler: nil)

        }
       
       func testgetLatestEvent() {
         let expec = expectation(description: "waiting for API latest result result")
           dataSource.getLatestResults(id: "4328", complitionHandler: { (result,Error) in
              if result != nil {
                  XCTAssertEqual(result?.count, 100, "API Faild")
                                 expec.fulfill()
              }else{
                  XCTFail()
              }
              })
          waitForExpectations(timeout: 5, handler: nil)

       }
       
       func testgetTeams() {
         let expec = expectation(description: "waiting for API teams result")
           dataSource.getTeam(id: "English%20Premier%20League", complitionHandler: { (result,Error) in
              if result != nil {
                  XCTAssertEqual(result?.count, 20, "API Faild")
                                 expec.fulfill()
              }else{
                  XCTFail()
              }
              })
          waitForExpectations(timeout: 5, handler: nil)

       }
       
}
