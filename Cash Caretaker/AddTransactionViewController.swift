//
//  AddTransactionViewController.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 3/16/16.
//  Copyright © 2016 Adam McNeilly. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class AddTransactionViewController: UIViewController {

    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    
    // MARK: Properties
    let formatter = NumberFormatter()
    var account: Account?
    
    @IBAction func saveTransaction(_ sender: AnyObject) {
        //TODO:
        if(descriptionTextField.text != "" && amountTextField.text != "") {
            print("Text is: " + amountTextField.text!)
            let amount = formatter.number(from: amountTextField.text!) as? NSDecimalNumber ?? 0
            saveTransaction(descriptionTextField.text!, amount: amount)
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        formatter.generatesDecimalNumbers = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Core Data
    func saveTransaction(_ description: String, amount: NSDecimalNumber) {
        let newTransaction = Transaction()
        newTransaction.trDescription = description
        newTransaction.amount = Double(amount)
        
        account?.addTransaction(transaction: newTransaction)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
