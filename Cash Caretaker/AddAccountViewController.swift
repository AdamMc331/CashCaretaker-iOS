//
//  AddAccountViewController.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 11/19/15.
//  Copyright © 2015 Adam McNeilly. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class AddAccountViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var accountName: UITextField!
    @IBOutlet var startingBalance: UITextField!
    
    // MARK: Properties
    let formatter = NumberFormatter()
    
    // MARK: Actions
    @IBAction func saveAccount(_ sender: AnyObject) {
        //TODO:
        if(accountName.text != "" && startingBalance.text != "") {
            let balance = formatter.number(from: startingBalance.text!) as? NSDecimalNumber ?? 0
            saveAccount(name: accountName.text!, balance: balance)
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: UIViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        formatter.generatesDecimalNumbers = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Realm
    func saveAccount(name: String, balance: NSDecimalNumber) {
        let newAccount = Account()
        newAccount.name = name
        newAccount.balance = Double(balance)
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newAccount)
        }
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
