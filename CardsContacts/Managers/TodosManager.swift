//
//  TodosManager.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftyJSON
import Alamofire

class TodosManager: ManagerProtocol {
    static let shared = TodosManager()
}

// API
extension TodosManager {

    func getTodo(byId id: Int, onCompletion: @escaping (TodoRecord?) -> Void) {
        let url = UrlRouting.getTodo

        requestService(url: url + "/\(id)", method: .get, parameters: nil) { (value) in
            guard let value = value else { return }
            let  json = JSON(value)
            let todo = TodoRecord(json: json)
            onCompletion(todo)
        }
    }

}
