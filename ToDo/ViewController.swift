//
//  ViewController.swift
//  ToDo
//
//  Created by Admin on 02.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    //MARK: - Variables
    private let fileName = "Lists"
    private var menuData = [TDCategoryMenu]()

    //MARK: - Life cycle method(s)
    override func viewDidLoad() {
        super.viewDidLoad()

        if (self.getDataForMainMenu()) {
            self.menuData.forEach {
                print("Title: ", $0.title)
                print("Image: ", $0.image)
                print("---------------------")
            }
            print("All good!")
        } else {
            print("Menu is empty..")
        }
    }
    
    //MARK: - Get data method
    private func getDataForMainMenu() -> Bool {
        guard let jsonData = Utility.readLocalJsonFile(forName: fileName) else {
            return false
        }
        let categoryList = Utility.parseJson(data: jsonData, ofType: TDCategoryList.self)
        
        guard let menu = categoryList?.lists else {
            return false
        }
        self.menuData = menu
        
        return true
    }
}

