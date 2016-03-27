//
//  TransactionTableViewController.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 3/6/16.
//  Copyright © 2016 Adam McNeilly. All rights reserved.
//

import UIKit
import CoreData

class TransactionTableViewController: UITableViewController {
    
    var account: NSManagedObject?

    // MARK: Properties
    var transactions = [NSManagedObject]()
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
        let fetchRequest = NSFetchRequest(entityName: "Transaction")
        print("Fetching for \(account)")
        let predicate = NSPredicate(format: "account == %@", account!)
        fetchRequest.predicate = predicate;
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            transactions = results as! [NSManagedObject]
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TransactionTableViewCell", forIndexPath: indexPath) as! TransactionTableViewCell

        // Configure the cell...
        let transaction = transactions[indexPath.row]
        
        //TODO:
        print(transaction.valueForKey("amount"))
        print(transaction.valueForKey("account"))
        
        cell.transactionDescriptionLabel.text = transaction.valueForKey("transactionDescription") as? String
        cell.transactionAmountLabel.text = formatter.stringFromNumber((transaction.valueForKey("amount") as? Double)!)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "addtransaction") {
            let destinationVC = segue.destinationViewController as! AddTransactionViewController
            destinationVC.account = account        }
    }

}
