//
//  CommentRecord.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON

struct CommentRecord {
    var postId: Int?
    var name: String?
    var id: Int?
    var body: String?
    var email: String?

    init(json: JSON) {
        if let dict = json.dictionary {
            postId = dict["postId"]?.intValue
            name = dict["name"]?.stringValue
            id = dict["id"]?.intValue
            body = dict["body"]?.stringValue
            email = dict["email"]?.stringValue
        }
    }
}
