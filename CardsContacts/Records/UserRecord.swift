//
//  UserRecord.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON

struct UserRecord {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var phone: String?

    init(json: JSON) {
        if let dict = json.dictionary {
            id = dict["id"]?.intValue
            name = dict["name"]?.stringValue
            username = dict["username"]?.stringValue
            phone = dict["phone"]?.stringValue
            email = dict["email"]?.stringValue
        }
    }
}
