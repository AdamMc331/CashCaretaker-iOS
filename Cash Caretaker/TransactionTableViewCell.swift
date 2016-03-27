//
//  TransactionTableViewCell.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 3/13/16.
//  Copyright © 2016 Adam McNeilly. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet var transactionDescriptionLabel: UILabel!
    @IBOutlet var transactionAmountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
