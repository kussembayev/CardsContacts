//
//  PostRecord.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON

struct PostRecord {
    var userId: Int?
    var title: String?
    var id: Int?
    var body: String?

    init(json: JSON) {
        if let dict = json.dictionary {
            userId = dict["userId"]?.intValue
            title = dict["title"]?.stringValue
            id = dict["id"]?.intValue
            body = dict["body"]?.stringValue
        }
    }
}
