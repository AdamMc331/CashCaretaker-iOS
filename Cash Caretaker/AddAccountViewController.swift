//
//  AddAccountViewController.swift
//  Cash Caretaker
//
//  Created by Adam McNeilly on 11/19/15.
//  Copyright © 2015 Adam McNeilly. All rights reserved.
//

import UIKit
import CoreData

class AddAccountViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var accountName: UITextField!
    @IBOutlet var startingBalance: UITextField!
    
    // MARK: Properties
    let formatter = NSNumberFormatter()
    
    // MARK: Actions
    @IBAction func saveAccount(sender: AnyObject) {
        //TODO:
        if(accountName.text != "" && startingBalance.text != "") {
            let balance = formatter.numberFromString(startingBalance.text!) as? NSDecimalNumber ?? 0
            saveAccount(accountName.text!, balance: balance)
            navigationController?.popViewControllerAnimated(true)
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
    
    // MARK: Core Data
    func saveAccount(name: String, balance: NSDecimalNumber) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Account", inManagedObjectContext: managedContext)
        
        let account = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        account.setValue(name, forKey: "name")
        account.setValue(balance, forKey: "balance")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
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
