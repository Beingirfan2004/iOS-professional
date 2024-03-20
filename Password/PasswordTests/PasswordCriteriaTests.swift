//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Irfan Khan on 20/03/24.
//

import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {

    // Boundary conditions 8-32
    
    func testShort() throws { // 7
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }

    func testLong() throws { // 33
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567890abcdefghijklmnopqrstuvw"))
    }
    
    func testValidShort() throws { // 8
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }

    func testValidLong() throws { // 32
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("1234567890abcdefghijklmnopqrstuv"))
    }
}


class PasswordOtherCriteriaTests: XCTestCase {
    
    // No Space Criteria
    
    func testSpaceMet() throws { // No space criteria met
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws { // No space criteria not met
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    // No Space and Length Criteria
    
    func testBothSpaceAndLengthMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    
    func testBothSpaceAndLengthNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("12345 6"))
    }
    
    func testOnlySpaceMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567"))
    }
    
    func testOnlyLengthMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }
    
    // Uppercase Criteria
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("Abcd"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("abcd"))
    }
    
    // Lowercase Criteria
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("ABCd"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("ABCD"))
    }
    
    // Digit Criteria
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("abcd123"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("abcd"))
    }
    
    // Special case Criteria
    
    func testSpecialCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("abcd@ABCD"))
    }
    
    func testSpecialCaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("abcdABCD"))
    }
}
