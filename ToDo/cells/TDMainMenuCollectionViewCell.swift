//
//  TDMainMenuCollectionViewCell.swift
//  ToDo
//
//  Created by Admin on 03.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

@IBDesignable
class TDMainMenuCell: UICollectionViewCell {
    //MARK: - Variables
    static let cellReuseIdentifier = "TDMainMenuCollectionViewCell"
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleLable: UILabel!
       
    func set(menuItem item: TDCategoryMenu, count: Int = 0) {
        self.imageIcon.image = UIImage(named: item.image)
        self.titleLable.text = item.title
        self.subtitleLable.text = "0 tasks"
    }
}
