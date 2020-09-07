//
//  ViewController.swift
//  ToDo
//
//  Created by Admin on 02.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TDMainMenuViewController: UIViewController {
    //MARK: - Variables
    private let fileName = "Lists"
    private let itemsPerRow: CGFloat = 2
    private let interItemInset: CGFloat = 20
    private let cellHeight: CGFloat = 180
    private let sectionInsets = UIEdgeInsets(top: 30, left: 16, bottom: 10, right: 16)
    
    private var menuItems = [TDCategoryMenu]()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
    }
    
    //MARK: - Life cycle method(s)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.fileName

        self.menuItems = self.getData(by: self.fileName)
        self.collectionView.reloadData()
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

// MARK: - Collection View Datasource Methods
extension TDMainMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.menuItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: TDMainMenuCell.reuseIdentifier,
                                                           for: indexPath) as? TDMainMenuCell ?? TDMainMenuCell()
        cell.cellContentView.set(menuItem: menuItems[indexPath.row])

        return cell
    }
}

// MARK: - Collection View Flow Layout Delegate
extension TDMainMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = self.interItemInset + self.sectionInsets.left * self.itemsPerRow
        let width = (self.view.frame.width - totalSpacing) / self.itemsPerRow

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return self.interItemInset
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return self.interItemInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.sectionInsets
    }
}
