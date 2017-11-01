//
//  TodoRecord.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON

struct TodoRecord {
    var id: Int?
    var title: String?
    var completed: Bool?

    init(json: JSON) {
        if let dict = json.dictionary {
            id = dict["id"]?.intValue
            title = dict["title"]?.stringValue
            completed = dict["completed"]?.boolValue
        }
    }
}
