//
//  Constants.swift
//  ToDo
//
//  Created by Dmitry Makarevich on 27.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct Constants {
    static let fileName: String = "Lists"
    
    struct NCNames {
        static let categories = Notification.Name("updateCategories")
    }
    
    struct Storyboard {
        static let createNewTaskVC = "CreateNewTaskViewController"
        static let datePickerVC = "DatePickerPopupViewController"
        static let categoryPickerVC = "CategoryPickerPopupViewController"
    }

    struct Images {
        static let close: String = "close"
        static let add: String = "add"
        static let menu: String = "menu-4"
        static let back: String = "back"
        static let check: String = "check"
    }
}
