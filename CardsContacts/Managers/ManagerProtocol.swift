//
//  ManagerProtocol.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import SwiftMessages
import Alamofire

protocol ManagerProtocol {

}

// **************************************************************************************************
// MARK: - Alamofire

extension ManagerProtocol {

    func requestService(url: String, method: HTTPMethod, parameters: [RequestParams: Any]?, onCompletion: @escaping (Any?) -> Void) {

        var mappedParameters = Dictionary<String, Any>()

        if let parameters = parameters {
            for (key, val) in parameters {
                mappedParameters[key.rawValue] = val
            }
        }

        let manager = Alamofire.SessionManager.default

        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?

            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)

                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }

            return (disposition, credential)
        }
        //        var headers = [String: String]()
        //        if let token = UserDefaults.standard.object(forKey: UserDefaultConstants.accessToken) as? String {
        //            headers = [
        //                "Authorization": "Bearer \(token)"
        //            ]
        //        }
        if Reachability.isInternetAvailable() {
            //printDebug(mappedParameters)

            manager.request(url, method: method, parameters: mappedParameters, encoding: JSONEncoding.default, headers: nil)
                .responseJSON {
                    response in
                    //printDebug(response.response ?? "response is nil")
                    switch response.result {

                    case .success(let value):
                        onCompletion(value)

                    case .failure(let error):
                        self.showErrorStatusMessage(message: "something-wrong-server \(error)")
                        onCompletion(nil)
                        //printDebug(error)
                    }
            }
        } else {
            showErrorMessage(message: "the-internet-connection")
        }
    }
}

// **************************************************************************************************
// MARK: - Messages

extension ManagerProtocol {

    func showErrorStatusMessage(message: String) {
        let errorView = MessageView.viewFromNib(layout: .StatusLine)
        errorView.configureTheme(.error)
        errorView.configureDropShadow()
        errorView.configureContent(title: "error", body: message)
        errorView.button?.isHidden = true
        SwiftMessages.show(view: errorView)
    }

    func showErrorMessage(message: String) {
        let errorView = MessageView.viewFromNib(layout: .MessageView)
        errorView.configureTheme(.error)
        errorView.configureDropShadow()
        errorView.configureContent(title: "error", body: message)
        errorView.button?.isHidden = true
        SwiftMessages.show(view: errorView)
    }

    func showSuccessMessage(message: String) {
        let errorView = MessageView.viewFromNib(layout: .MessageView)
        errorView.configureTheme(.success)
        errorView.configureDropShadow()
        errorView.configureContent(title: "success", body: message)
        errorView.button?.isHidden = true
        SwiftMessages.show(view: errorView)
    }
}
