//
//  CategoryMenu.swift
//  ToDo
//
//  Created by Admin on 02.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct CategoryMenu: Codable {
    let title: String
    let image: String
    var count: Int = 0

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case image
    }
    
    init(item: CategoryMenu, count: Int) {
        self.title = item.title
        self.image = item.image
        self.count = count
    }
}

struct CategoryList: Codable {
    let lists: [CategoryMenu]
}
