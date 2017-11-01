//
//  CommentTableViewCell.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

protocol CommentTableViewCellDelegate: class {
    func getComment(byId id: Int)
}

class CommentTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textField: UITextField!

    // MARK: - Properties
    var comment: CommentRecord? {
        didSet {
            setupData()
        }
    }
    weak var delegate: CommentTableViewCellDelegate?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        sendButton.roundCorners(20)
        cardView.makeShadow()
        selectionStyle = .none
    }

    private func setupData() {
        emailLabel.text = comment?.email
        nameLabel.text = comment?.name
        bodyLabel.text = comment?.body
    }

    @IBAction func sendAction(_ sender: Any) {
        if let text = textField.text {
            if !text.isEmpty {
                let id = Int(text)
                delegate?.getComment(byId: id!)
                textField.text = ""
            }
        }
    }
}
