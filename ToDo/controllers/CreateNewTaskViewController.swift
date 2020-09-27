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
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var bottomCreateButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        self.title = "New Task"
        self.addKeyboardShowListeners()
    }

    //MARK: - Selectors
    @objc func keybordWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        guard let keyboardNSValue: NSValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        var keyboardFrame: CGRect = keyboardNSValue.cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        // обращение к вашему скроллу
        self.bottomCreateButtonConstraint.constant = keyboardFrame.height
        self.scrollView.contentInset.bottom = -keyboardFrame.height
    }

    @objc func keybordWillHide(_ notification: Notification) {
        // обращение к вашему скроллу
        self.scrollView.contentInset.bottom = 0
        self.bottomCreateButtonConstraint.constant = 0
        
    }
    
    //MARK: -
    private func addKeyboardShowListeners() {
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(keybordWillShow),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(keybordWillHide),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
    }
}
