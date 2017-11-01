//
//  UsersManager.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON
import Alamofire

class UsersManager: ManagerProtocol {
    static let shared = UsersManager()
}

// API
extension UsersManager {

    func listUsers(userId id: Int?, onCompletion: @escaping ([UserRecord]) -> Void) {
        var url = ""

        if let id = id {
            url = UrlRouting.listUsers + "/\(id)"
        } else {
            url = UrlRouting.listUsers
        }

        requestService(url: url, method: .get, parameters: nil) { (value) in
            var users = [UserRecord]()
            guard let value = value else { return }
            let json = JSON(value)
            if id == nil {
                for (index, json) in json.arrayValue.enumerated() {
                    if index < 5 {
                        let user = UserRecord(json: json)
                        users.append(user)
                    }
                }
            } else {
                let user = UserRecord(json: json)
                users.append(user)
            }

            onCompletion(users)
        }
    }

}
