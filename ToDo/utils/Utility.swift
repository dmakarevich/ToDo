//
//  Utility.swift
//  ToDo
//
//  Created by Admin on 03.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct Utility {    
    //MARK: - Read and parsing json file
    static func readLocalJsonFile(forName name: String) -> Data? {
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

    static func parseJson<T: Decodable>(data: Data, ofType type: T.Type) -> T? {
        var list: T?
        do {
            let decodedData = try JSONDecoder().decode(T.self,
                                                       from: data)
            list = decodedData
        } catch {
            print("decode error")
        }

        return list
    }

    //MARK: - Converting Date to String
    static func dateToString(date: Date? = Date()) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM HH:mm"
        guard let date = date else {
            return formatter.string(from: Date())
        }

        return formatter.string(from: date)
    }
}
