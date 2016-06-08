//
//  RepresentativeController.swift
//  Representative
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseUrl = "http://whoismyrepresentative.com/"
    
    static func searchURLForState(searchTerm: String) -> NSURL {
        return NSURL(string: baseUrl + "getall_reps_bystate.php?state=\(searchTerm)&output=json")!
    }
    
    static func searchRepsByState(searchTerm: String, completion: (representatives: [Representative]) -> Void) {
        let url = searchURLForState(searchTerm)
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data, jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
            repDictionary = jsonDictionary["results"] as? [[String: AnyObject]] else {
                completion(representatives: [])
                return
            }
            
            let representatives = repDictionary.flatMap({Representative(dictionary: $0)})
            completion(representatives: representatives)
            
            print(data)
            print(representatives)
            for i in representatives {
                print(i.name)
            }
        }
    }
    
}