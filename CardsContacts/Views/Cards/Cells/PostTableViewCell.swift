//
//  CardTableViewCell.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

protocol PostTableViewCellDelegate: class {
    func getPost(byId id: Int)
}

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    // MARK: - Properties
    var post: PostRecord? {
        didSet {
            setupData()
        }
    }
    weak var delegate: PostTableViewCellDelegate?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        sendButton.roundCorners(20)
        cardView.makeShadow()
    }

    private func setupData() {
        titleLabel.text = post?.title
        bodyLabel.text = post?.body
    }

    @IBAction func sendAction(_ sender: Any) {
        if let text = textField.text {
            if !text.isEmpty {
                let id = Int(text)
                delegate?.getPost(byId: id!)
                textField.text = ""
            }
        }
    }
}
