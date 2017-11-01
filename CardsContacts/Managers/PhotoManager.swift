//
//  PhotoManager.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON
import Alamofire

class PhotoManager: ManagerProtocol {
    static let shared = PhotoManager()
}

// API
extension PhotoManager {

    func getPhoto(byId id: Int, onCompletion: @escaping (PhotoRecord?) -> Void) {
        let url = UrlRouting.getPhoto

        requestService(url: url + "/\(id)", method: .get, parameters: nil) { (value) in
            guard let value = value else { return }
            let  json = JSON(value)
            let photo = PhotoRecord(json: json)

            onCompletion(photo)
        }
    }

}
