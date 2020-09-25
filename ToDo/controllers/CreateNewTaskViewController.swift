//
//  CreateNewTaskViewController.swift
//  ToDo
//
//  Created by Dmitry Makarevich on 25.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CreateNewTaskViewController: UIViewController {
    @IBOutlet weak var taskNameView: UITextView!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var categoryLabel: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        self.title = "New Task"
    }

 
}
