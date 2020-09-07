//
//  TDMenuItemView.swift
//  ToDo
//
//  Created by Admin on 04.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

@IBDesignable
class TDMenuItemView: TDDesignableView {
    private let selfName = "TDMenuItemView"
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtiteLabel: UILabel!
    
    func set(menuItem item: TDCategoryMenu) {
        self.iconImage.image = UIImage(named: item.image)
        self.titleLabel.text = item.title
        self.subtiteLabel.text = "0 tasks"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle.init(for: TDMenuItemView.self)
        if let viewsToAdd = bundle.loadNibNamed(self.selfName, owner: self, options: nil),
            let contentView = viewsToAdd.first as? UIView {
            self.addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }

    func clear() {
        self.iconImage.image = nil
        self.titleLabel.text = ""
        self.subtiteLabel.text = ""
    }
}
