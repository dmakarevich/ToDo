//
//  MenuViewController.swift
//  ToDo
//
//  Created by Admin on 02.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    //MARK: - Variables
    private let fileName = "Lists"
    private var menuItems = [TDCategoryMenu]()
    
    private enum CollectionViewInsets {
        case top, left, bottom, right
        case itemsPerRow
        case interItemInset
        case lineInset

        private static let cellsPerRow: CGFloat = 2
        private static let interItem: CGFloat = 20
        private static let line: CGFloat = 20
        private static let sectionInsets = UIEdgeInsets(top: 30, left: 16, bottom: 10, right: 16)

        static func getInset(by type: CollectionViewInsets) -> CGFloat {
            switch type {
            case .itemsPerRow:
                return cellsPerRow
            case .interItemInset:
                return interItem
            case .lineInset:
                return line
            case .top:
                return sectionInsets.top
            case .left:
                return sectionInsets.left
            case .bottom:
                return sectionInsets.bottom
            case .right:
                return sectionInsets.right
            }
        }

        static func geEdgeInset() -> UIEdgeInsets {

            return sectionInsets
        }
    }
    
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
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return menuItems.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: MainMenuCell.reuseIdentifier,
                                 for: indexPath) as? MainMenuCell ?? MainMenuCell()
        cell.cellContentView.set(menuItem: menuItems[indexPath.row])

        return cell
    }
}

// MARK: - Collection View Flow Layout Delegate
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow = CollectionViewInsets.getInset(by: .itemsPerRow)
        let interItemInset = CollectionViewInsets.getInset(by: .interItemInset)
        let leftSpacing = CollectionViewInsets.getInset(by: .left)
        let rightSpacing = CollectionViewInsets.getInset(by: .right)
        
        let totalSpacing = leftSpacing + rightSpacing + interItemInset
        let width = (self.view.frame.width - totalSpacing) / itemsPerRow

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return CollectionViewInsets.getInset(by: .lineInset)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return CollectionViewInsets.getInset(by: .interItemInset)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return CollectionViewInsets.geEdgeInset()
    }
}
