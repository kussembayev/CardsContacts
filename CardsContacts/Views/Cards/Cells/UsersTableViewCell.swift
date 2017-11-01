//
//  UsersTableViewCell.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

let userCell = "UserTableViewCell"

protocol UsersTableViewCellDelegate: class {
    func getUser(byId id: Int)
}

class UsersTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textField: UITextField!

    // MARK: - Properties
    var users: [UserRecord]? {
        didSet {
            if let count = users?.count {
                tableHeight.constant = CGFloat(count * 44)
            }
            tableView.reloadData()
        }
    }

    weak var delegate: UsersTableViewCellDelegate?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        sendButton.roundCorners(20)
        cardView.makeShadow()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 360
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: userCell, bundle: nil), forCellReuseIdentifier: userCell)
    }

    @IBAction func sendAction(_ sender: Any) {
        if let text = textField.text {
            if !text.isEmpty {
                let id = Int(text)
                delegate?.getUser(byId: id!)
                textField.text = ""
            }
        }
    }
}

//
extension UsersTableViewCell: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = users?.count {
            return count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCell, for: indexPath) as! UserTableViewCell
        cell.user = users?[indexPath.row]
        return cell
    }
}
