//
//  Profile.swift
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/17/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

import UIKit
import ObjectMapper

class Profile: Mappable {
    var firstName : String?
    var lastName : String?
    var headline : String?
    var id : String?
    var siteStandardProfileRequest : String?
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        firstName    <- map["firstName"]
        lastName         <- map["lastName"]
        headline      <- map["headline"]
        id       <- map["id"]
    }
}
