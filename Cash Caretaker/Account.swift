//
//  Account.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 11/19/15.
//  Copyright © 2015 Adam McNeilly. All rights reserved.
//

import Foundation

public class Account {
    // MARK: Properties
    var name: String
    var balance: NSDecimalNumber
    
    // MARK: Constructors
    public init?(name: String, balance: NSDecimalNumber) {
        self.name = name
        self.balance = balance
        
        // Initialization should fail if there is no name.
        if(name.isEmpty) {
            return nil
        }
    }
}