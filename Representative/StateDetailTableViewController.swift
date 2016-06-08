//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    var representatives: [Representative] = []
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            RepresentativeController.searchRepsByState(state) { (representatives) in
                self.representatives = representatives
            }
            dispatch_async(dispatch_get_main_queue(), { 
                self.tableView.reloadData()
            })
        }
        
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath) as? RepTableViewCell

        cell?.updateWithRepresentative()

        return cell ?? RepTableViewCell()
    }

}
