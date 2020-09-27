//
//  DatePickerPopupViewController.swift
//  ToDo
//
//  Created by Dmitry Makarevich on 25.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class DatePickerPopupViewController: UIViewController {
    //MARK: - Variables
    @IBOutlet weak var datePicker: UIDatePicker!
    var completionHandler: ((Date?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.datePicker.minimumDate = Date()
        self.datePicker.datePickerMode = .dateAndTime
        if #available(iOS 13.4, *) {
            self.datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    //MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true) { [self] in
            self.completionHandler?(datePicker.date)
        }
    }
}
