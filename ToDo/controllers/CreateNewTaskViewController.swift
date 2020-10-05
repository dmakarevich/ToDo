//
//  CreateNewTaskViewController.swift
//  ToDo
//
//  Created by Dmitry Makarevich on 25.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CreateNewTaskViewController: UIViewController {
    //MARK: - Variables
    private var date: Date = Date() {
        didSet {
            self.dateLabel.text = Utility.dateToString(date: date)
        }
    }

    @IBOutlet weak var taskNameView: UITextView!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var categoryLabel: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var bottomCreateButtonConstraint: NSLayoutConstraint!

    private lazy var  rightBarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(image: UIImage(named: Constants.Images.close),
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.closeButtonTapped))
        item.tintColor = .black

        return item
    }()

    //MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New Task"
        self.dateLabel.text = Utility.dateToString()
        self.addKeyboardShowListeners()
        self.setupNavigationBar()
    }

    //MARK: - Selectors
    @objc func keybordWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        guard let keyboardNSValue: NSValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        var keyboardFrame: CGRect = keyboardNSValue.cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        self.bottomCreateButtonConstraint.constant = keyboardFrame.height
        self.scrollView.contentInset.bottom = -keyboardFrame.height
    }

    @objc func keybordWillHide(_ notification: Notification) {
        self.scrollView.contentInset.bottom = 0
        self.bottomCreateButtonConstraint.constant = 0
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    //MARK: - Actions
    @IBAction func dateButtonTapped(_ sender: Any) {
        guard let vc = self
                .storyboard?
                .instantiateViewController(withIdentifier: Constants.Storyboard.datePickerVC) as? DatePickerPopupViewController else {
            return
        }
        vc.completionHandler = {[weak self] (date) in
            guard let self = self else { return }
            self.date = date ?? Date()
        }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func categoryButtonTapped(_ sender: Any) {
        guard let vc = self
                .storyboard?
                .instantiateViewController(withIdentifier: Constants.Storyboard.categoryPickerVC) as? CategoryPickerPopupViewController else {
            return
        }
        vc.completionHandler = {[weak self] (category) in
            guard let self = self else { return }
            self.categoryLabel.text = category.title
        }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }

    //MARK: - Utils
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

    private func setupNavigationBar() {
        self.navigationItem.setRightBarButton(self.rightBarButtonItem, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.largeTitleDisplayMode = .never
    }
}
