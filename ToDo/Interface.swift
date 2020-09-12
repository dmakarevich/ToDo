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
    
    private lazy var mainViewController = MenuViewController()
    weak var window: UIWindow?
    
    func setup(window: UIWindow) {
        self.window = window
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
        
    }
    
    private func setUpNavigationBarStyle() {
        let navBar = UINavigationBar.appearance()
        navBar.backgroundColor = .white
        navBar.tintColor = .black
        navBar.prefersLargeTitles = true
        
        let newNavBar = UINavigationBarAppearance()
        newNavBar.configureWithDefaultBackground()
        
        navBar.scrollEdgeAppearance = newNavBar
    }
}
