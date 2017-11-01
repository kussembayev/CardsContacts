//
//  ContactsViewController.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        let defaultNavigationBarFrame = CGRect(x: 0,
                                               y: 0,
                                               width: self.view.bounds.width,
                                               height: headerView.bounds.height)
        gradientLayer.frame = defaultNavigationBarFrame
        gradientLayer.colors = [UIColor.navBarLeft().cgColor,
                                UIColor.navBarMiddle().cgColor,
                                UIColor.navBarRight().cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        headerView.layer.insertSublayer(gradientLayer, at: 0)

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = headerView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerView.addSubview(blurEffectView)
    }
}
