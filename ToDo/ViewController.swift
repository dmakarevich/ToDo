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
    private var list = [TDCategoryMenu]()

    //MARK: - Life cycle method(s)
    override func viewDidLoad() {
        super.viewDidLoad()

        if let jsonData = self.readLocalFile(forName: fileName) {
            self.list = self.parse(data: jsonData)

            list.forEach {
                print("Title: ", $0.title)
                print("Image: ", $0.image)
                print("---------------------")
            }
        }
    }
    
    //MARK: - Read and parsing json file
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {

                return jsonData
            }
        } catch {
            print(error)
        }

        return nil
    }

    private func parse(data: Data) -> [TDCategoryMenu] {
        var list = [TDCategoryMenu]()

        do {
            let decodedData = try JSONDecoder().decode(TDCategoryList.self,
                                                       from: data)
            list = decodedData.lists
        } catch {
            print("decode error")
        }

        return list
    }

}

