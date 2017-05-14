//
//  MasterInfo.swift
//  HairSalone New 1.0
//
//  Created by Elvin778 on 03.05.17.
//  Copyright © 2017 Elvin778. All rights reserved.
//

import Foundation
class MasterInfo {
    var name : String?
    var lastName : String?
    var number : String?
    var password : String
    var email : String
    init (name : String,lastName : String, number : String, password : String, email : String){
        self.name = name
        self.lastName = lastName
        self.number = number
        self.password = password
        self.email = email
    }
}
