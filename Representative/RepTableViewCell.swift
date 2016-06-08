//
//  RepTableViewCell.swift
//  Representative
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    
    func updateWithRepresentative(representative: Representative) {
        nameLabel.text = "\(representative.name) (\(representative.party))"
        districtLabel.text = "District \(representative.district)"
        websiteLabel.text = representative.link
        phoneLabel.text = representative.phone
    }

}

