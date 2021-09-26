//
//  IDriveKartTests.swift
//  IDriveKartTests
//
//  Created by Farooque Azam on 18/09/21.
//

import XCTest
@testable import IDriveKart

class IDriveKartTests: XCTestCase {
    
    let itemListAPIClienet = MockIKartItemAPIClient()
    
    
    func testItemListResponse(){
        
        let expectation = self.expectation(description: "ItemListResponse")
        let urlString = URL(string : APIManager.shared.baseURL)
        
        itemListAPIClienet.getAPiData(requestURL: urlString!, resultType:  IKartItem.self) { data, error in
            
            XCTAssertNil(error)
            XCTAssertNotNil([IKartItem].self)
            expectation.fulfill()
            
        }
        
        
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
}
