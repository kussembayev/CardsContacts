//
//  UserTableViewCell.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    // MARK: - Properties
    var user: UserRecord? {
        didSet {
            setupData()
        }
    }

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setupData() {
        nameLabel.text = user?.name
        phoneLabel.text = user?.phone
    }

}
