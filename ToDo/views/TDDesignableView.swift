//
//  TDDesignableView.swift
//  ToDo
//
//  Created by Admin on 04.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

@IBDesignable
class TDDesignableView: UIView {
    @IBInspectable
    private var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    private var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }

    @IBInspectable
    private var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }

}
