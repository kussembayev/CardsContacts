//
//  BaseNavigationController.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationBarDelegate {

    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }

    private func setupNavBar() {
        let gradientLayer = CAGradientLayer()
        let defaultNavigationBarFrame = CGRect(x: 0,
                                               y: 0,
                                               width: self.navigationBar.bounds.width,
                                               height: 64)
        gradientLayer.frame = defaultNavigationBarFrame
        gradientLayer.colors = [UIColor.navBarLeft().cgColor,
                                UIColor.navBarMiddle().cgColor,
                                UIColor.navBarRight().cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        // Render the gradient to UIImage
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
