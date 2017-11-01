//
//  UIViewExtension.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

//
extension UIView {

    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.25
    }

    func round(_ round: Bool = true, borderWidth: Float = 0, _ borderColor: UIColor = UIColor.clear) {
        self.layer.masksToBounds = true
        self.border(width: round ? borderWidth : 0, color: round ? borderColor : UIColor.clear)
        self.roundCorners(round ? Float(self.frame.width/2) : 0)
    }

    func roundCorners(_ radius: Float = 3.0) {
        self.layer.cornerRadius = CGFloat(radius)
    }

    func roundCorner(_ corner: UIRectCorner, _ radius: Float = 3.0) {
        let radiusCG = CGFloat(radius)
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radiusCG, height: radiusCG))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }

    func border(width: Float = 0, color: UIColor = UIColor.clear) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color.cgColor
    }

}
