//
//  MainMenuCell.swift
//  ToDo
//
//  Created by Admin on 04.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

@IBDesignable
class MainMenuCell: UICollectionViewCell {
    static let reuseIdentifier = "MainMenuCell"
    
    @IBInspectable
    private var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBOutlet weak var cellContentView: MenuItemView!
    
    override func prepareForReuse() {
        super.prepareForReuse()

        self.cellContentView.clear()
    }
}
