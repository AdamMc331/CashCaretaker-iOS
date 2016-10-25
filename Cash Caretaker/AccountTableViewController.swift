//
//  ViewController.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 11/19/15.
//  Copyright © 2015 Adam McNeilly. All rights reserved.
//

import UIKit
import CoreData

import RealmSwift

class AccountTableViewController: UITableViewController {

    // MARK: Properties
    let realm = try! Realm()
    lazy var accounts: Results<Account> = { self.realm.objects(Account.self) }()
    
    let formatter = NumberFormatter()
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup formatter
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Query for accounts
        accounts = realm.objects(Account.self)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewController
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AccountTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AccountTableViewCell
        
        // Fetch account
        let account = accounts[(indexPath as NSIndexPath).row]
        
        // Configure cell
        cell.accountNameLabel.text = account.name
        cell.accountBalanceLabel.text = String(format:"$%.2f", account.balance)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteClosure = { (action: UITableViewRowAction!, indexPath: IndexPath!) -> Void in self.deleteItemAtIndex(indexPath)
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: deleteClosure)
        
        return [deleteAction]
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Intentionally blank. Required to use UITableViewRowActions
    }
    
    // MARK: CoreData
    func deleteItemAtIndex(_ indexPath: IndexPath) {
        try! realm.write {
            realm.delete(accounts[(indexPath as NSIndexPath).row])
        }
        
        // Remove deleted item from table
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if(segue.identifier == "transactions") {
            let destinationVC = segue.destination as! TransactionTableViewController
            
            if let selectedAccountCell = sender as? AccountTableViewCell {
                let indexPath = tableView.indexPath(for: selectedAccountCell)!
                let selectedAccount = accounts[(indexPath as NSIndexPath).row]
                destinationVC.account = selectedAccount
                
            }
        }
    }
}

