//
//  Cash_CaretakerTests.swift
//  Cash CaretakerTests
//
//  Created by Adam McNeilly on 11/19/15.
//  Copyright © 2015 Adam McNeilly. All rights reserved.
//

import XCTest
@testable import Cash_Caretaker

class Cash_CaretakerTests: XCTestCase {
    
    func testInitialization() {
        // Success
        let validAccount = Account(name: "Checking", balance: 250.45)
        XCTAssertNotNil(validAccount, "Account is not valid.")
        
        // Bad name
        let invalidAccount = Account(name: "", balance: 250.45)
        XCTAssertNil(invalidAccount, "Account name is not empty.")
    }
    
}
