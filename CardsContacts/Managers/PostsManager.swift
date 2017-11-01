//
//  PostsManager.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class PostManager: ManagerProtocol {
    static let shared = PostManager()
}

// API
extension PostManager {

    func getPost(byId id: Int, onCompletion: @escaping (PostRecord?) -> Void) {
        let url = UrlRouting.getPost

        requestService(url: url + "/\(id)", method: .get, parameters: nil) { (value) in

            guard let value = value else { return }
            let json = JSON(value)
            let post = PostRecord(json: json)
            onCompletion(post)

        }
    }

}
