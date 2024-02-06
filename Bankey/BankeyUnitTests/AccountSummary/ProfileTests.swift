//
//  ProfileTests.swift
//  BankeyUnitTests
//
//  Created by Irfan Khan on 06/02/24.
//

import Foundation
import XCTest

@testable import Bankey

class ProfileTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
    }
    
    
    func testCanParse() throws {
        let json = """
        {
        "id" : "1",
        "first_name" : "Irfan",
        "last_name" : "Khan",
        }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
        
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "Irfan")
        XCTAssertEqual(result.lastName, "Khan")
        
        
    }
}
