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

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case image
    }
}

struct CategoryList: Codable {
    let lists: [CategoryMenu]
}
