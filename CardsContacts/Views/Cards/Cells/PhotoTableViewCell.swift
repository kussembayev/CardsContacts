//
//  PhotoTableViewCell.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit
import SDWebImage

protocol PhotoTableViewCellDelegate: class {
    func getPhoto(byId id: Int)
}

class PhotoTableViewCell: UITableViewCell {

     // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - Properties
    var photo: PhotoRecord? {
        didSet {
            setupData()
        }
    }

    weak var delegate: PhotoTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.makeShadow()
        sendButton.roundCorners(20)

    }

    private func setupData() {
        titleLabel.text = photo?.title
        if let url = photo?.url {
            print(url)

            coverView.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "avatar.astronaut"))
        }
    }

    @IBAction func sendAction(_ sender: Any) {
        if let text = textField.text {
            if !text.isEmpty {
                let id = Int(text)
                delegate?.getPhoto(byId: id!)
                textField.text = ""
            }
        }
    }
}
