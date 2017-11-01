//
//  CommentManager.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class CommentManager: ManagerProtocol {
    static let shared = CommentManager()
}

// API
extension CommentManager {

    func getComment(byId id: Int, onCompletion: @escaping (CommentRecord?) -> Void) {
        let url = UrlRouting.getComment

        requestService(url: url + "/\(id)", method: .get, parameters: nil) { (value) in

            guard let value = value else { return }
            let json = JSON(value)
            let comment = CommentRecord(json: json)
            onCompletion(comment)

        }
    }

}
