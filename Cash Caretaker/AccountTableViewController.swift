//
//  ViewController.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 11/19/15.
//  Copyright © 2015 Adam McNeilly. All rights reserved.
//

import UIKit
import CoreData

class AccountTableViewController: UITableViewController {

    // MARK: Properties
    var accounts = [NSManagedObject]()
    let formatter = NSNumberFormatter()
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup formatter
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Fetch
        let fetchRequest = NSFetchRequest(entityName: "Account")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            accounts = results as! [NSManagedObject]
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewController
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AccountTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AccountTableViewCell
        
        // Fetch account
        let account = accounts[indexPath.row]
        
        // Configure cell
        cell.accountNameLabel.text = account.valueForKey("name") as? String
        cell.accountBalanceLabel.text = formatter.stringFromNumber((account.valueForKey("balance") as? Double)!)
        
        return cell
    }
}

