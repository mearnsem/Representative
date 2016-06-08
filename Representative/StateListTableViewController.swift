//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateController.states.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stateCell", forIndexPath: indexPath)

        let state = StateController.states[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? StateDetailTableViewController, indexpath = tableView.indexPathForSelectedRow?.row {
            let state = StateController.states[indexpath]
            destinationViewController.state = state
        }
        
    }
    

}
