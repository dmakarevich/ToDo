//
//  Interface.swift
//  ToDo
//
//  Created by Admin on 03.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class Interface {
    static let sh = Interface()

    private(set) var categories = [CategoryMenu]()

    private init() {}

    func setup() {
        self.categories = self.getData(by: Constants.fileName)
        NotificationCenter
            .default
            .post(name: Constants.NCNames.categories,
                  object: self)
    }

    //MARK: - Get data method
    private func getData(by name: String) -> [CategoryMenu] {
        guard let jsonData = Utility.readLocalJsonFile(forName: name) else {
            return []
        }
        let categoryList = Utility.parseJson(data: jsonData, ofType: CategoryList.self)

        guard let menu = categoryList?.lists else {
            return []
        }

        return menu
    }
}
