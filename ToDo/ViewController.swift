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

        self.menuData = self.getData(by: self.fileName)
        self.menuData.forEach {
            print("Title: ", $0.title)
            print("Image: ", $0.image)
            print("---------------------")
        }
    }
    
    //MARK: - Get data method
    private func getData(by name: String) -> [TDCategoryMenu] {
        guard let jsonData = Utility.readLocalJsonFile(forName: name) else {
            return []
        }
        let categoryList = Utility.parseJson(data: jsonData, ofType: TDCategoryList.self)
        
        guard let menu = categoryList?.lists else {
            return []
        }
        
        return menu
    }
}
