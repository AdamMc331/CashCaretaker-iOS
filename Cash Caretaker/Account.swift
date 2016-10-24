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
}
