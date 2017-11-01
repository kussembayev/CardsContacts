//
//  PhotoRecord.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON

struct PhotoRecord {
    var id: Int?
    var title: String?
    var thumbnailUrl: String?
    var url: String?

    init(json: JSON) {
        if let dict = json.dictionary {
            id = dict["id"]?.intValue
            title = dict["title"]?.stringValue
            thumbnailUrl = dict["thumbnailUrl"]?.stringValue
            url = dict["url"]?.stringValue
        }
    }
}
