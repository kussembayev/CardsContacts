//
//  TodosTableViewCell.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

protocol TodosTableViewCellDelegate: class {
    func getTodo(byId id: Int)
}

class TodosTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!

    // MARK: - Properties
    var todo: TodoRecord? {
        didSet {
            setupData()
        }
    }

    weak var delegate: TodosTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.makeShadow()
        sendButton.roundCorners(20)

    }

    private func setupData() {
        titleLabel.text = todo?.title
        if (todo?.completed)! {
            completedImageView.image = #imageLiteral(resourceName: "check")
        } else {
            completedImageView.image = #imageLiteral(resourceName: "uncheck")
        }
    }

    @IBAction func sendAction(_ sender: Any) {
        if let text = textField.text {
            if !text.isEmpty {
                let id = Int(text)
                delegate?.getTodo(byId: id!)
                textField.text = ""
            }
        }
    }
}
