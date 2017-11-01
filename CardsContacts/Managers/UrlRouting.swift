//
//  UrlRouting.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import Foundation

enum RemoteServerIP {
    static let serverUrl = "https://jsonplaceholder.typicode.com"

}

enum UrlRouting {
}

extension UrlRouting {
    static let getPost = RemoteServerIP.serverUrl + "/posts/"
    static let getComment = RemoteServerIP.serverUrl + "/comments/"
    static let listUsers = RemoteServerIP.serverUrl + "/users/"
    static let getPhoto = RemoteServerIP.serverUrl + "/photos/"
    static let getTodo = RemoteServerIP.serverUrl + "/todos/"
}
