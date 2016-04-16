//
//  ViewController.swift
//  Reminder
//
//  Created by Notorious MAC on 12/21/15.
//  Copyright © 2015 Notorious MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var item = [String]()

    @IBOutlet weak var reminder: UILabel!
   
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addBtn(sender: AnyObject) {
        
        let newItem = textField.text
        
        reminder.text="Reminder"
        
        if textField.text == "" {
            textField.placeholder = "Enter Valid Data"
        
            
        }else{
            textField.placeholder = "Enter Reminder"

        item.append(newItem!)
                                                // this takes whatever written in textfield and adds to item
        textField.resignFirstResponder()
        textField.text = ""                     // creates empty text field
        tableView.reloadData()                  // relodes tableView with new Data
        }
        
        
        
        
    }
    
    // to hide the keyboard when user taps wlse where in the screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        
         reminder.text="Reminder"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return item.count
        
    }
    
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    cell.textLabel?.text = item[indexPath.row]
    
    return cell
}
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedRow = tableView.cellForRowAtIndexPath(indexPath)
        if selectedRow?.accessoryType == UITableViewCellAccessoryType.None {
            selectedRow?.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedRow?.tintColor = UIColor.greenColor()
            
            
        } else {
            selectedRow?.accessoryType = UITableViewCellAccessoryType.None
        }

    } // end of didDeswlectRowAtIndex
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let deletedRow : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        if editingStyle == UITableViewCellEditingStyle.Delete{
            item.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            deletedRow.accessoryType = UITableViewCellAccessoryType.None
            
        }
        
        
    }
    
    // to hide keyboard when user clicks in blank spaces
    
    


    
    

}

