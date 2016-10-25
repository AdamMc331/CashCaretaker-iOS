//
//  Account.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 11/19/15.
//  Copyright © 2015 Adam McNeilly. All rights reserved.
//

import Foundation
import RealmSwift

class Account: Object {
    // MARK: Properties
    dynamic var name = ""
    dynamic var balance = 0.00
    let transactions = List<Transaction>()
    
    func addTransaction(transaction: Transaction) {
        let realm = try! Realm()
        try! realm.write {
            if(transaction.withdrawal) {
                balance = balance - transaction.amount
            } else {
                balance = balance + transaction.amount
            }
            
            transactions.append(transaction)
        }
    }
}
