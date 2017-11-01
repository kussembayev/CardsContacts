//
//  TabBarViewController.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setupView()
        self.setupTabBar()
    }

    private func setupView() {
        let vc1 = UIStoryboard(name: "Cards", bundle: nil).instantiateInitialViewController()!
        let vc2 = UIStoryboard(name: "Contacts", bundle: nil).instantiateInitialViewController()!
        self.viewControllers = [vc1, vc2]

    }

    private func setupTabBar() {
        let gradientLayer = CAGradientLayer()
        let defaultNavigationBarFrame = CGRect(x: 0,
                                               y: 0,
                                               width: self.tabBar.bounds.width,
                                               height: self.tabBar.bounds.height)
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

        self.tabBar.backgroundImage = image
        self.tabBar.tintColor = UIColor.white
    }
}
