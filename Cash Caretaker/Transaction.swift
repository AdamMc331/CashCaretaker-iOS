//
//  Transaction.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 10/24/16.
//  Copyright © 2016 Adam McNeilly. All rights reserved.
//

import Foundation
import RealmSwift

class Transaction: Object {
    dynamic var trDescription = ""
    dynamic var amount = 0.00
    dynamic var notes = ""
    dynamic var date = NSDate(timeIntervalSince1970: 1)
    let category = Category()
    dynamic var withdrawal = true
}
