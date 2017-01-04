//
//  ManufacturerTableViewController.swift
//  Cars Mobile Sample
//
//  Created by Tom Batchelor on 11/7/16.
//  Copyright © 2016 Tom Batchelor. All rights reserved.
//

import UIKit

class ManufacturerTableViewController: UITableViewController {

    // MARK: Properties
    
    var manufacturers = [Manufacturer]()
    let carsByManufacturerSegue = "CarsByManufacturerSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestApiManager.sharedInstance.getManufacturers({manufacturers in
            self.manufacturers = manufacturers
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                return
            })
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
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
        return manufacturers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ManufacturerTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ManufacturerTableViewCell
        let manufacturer = manufacturers[indexPath.row]

        // Configure the cell...
        cell.manuName.text = manufacturer.name
        cell.manuLogo.image = manufacturer.logo
        return cell
    }

    // MARK - Actions
    
    @IBAction func unwindToMainMenu(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == carsByManufacturerSegue,
            let destination = segue.destinationViewController as? CarTableViewController,
            manufacturerIndex = tableView.indexPathForSelectedRow?.row {
                destination.manufacturer = manufacturers[manufacturerIndex]
        }
    }
}
