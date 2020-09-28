//
//  CategoryPickerPopupViewController.swift
//  ToDo
//
//  Created by Dmitry Makarevich on 27.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CategoryPickerPopupViewController: UIViewController {
    private var items: [CategoryMenu] = Interface.sh.categories
    private var selectedRow = 1
    private let componentsCount = 1
    var completionHandler: ((CategoryMenu) -> ())?
    
    @IBOutlet weak var categoryPicker: UIPickerView! {
        didSet {
            self.categoryPicker.dataSource = self
            self.categoryPicker.delegate = self
        }
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.completionHandler?(self.items[self.selectedRow])
        }
    }
}

extension CategoryPickerPopupViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return componentsCount
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.items[row].title
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = row
    }
}
