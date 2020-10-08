//
//  Task+CoreDataProperties.swift
//  ToDo
//
//  Created by Dmitry Makarevich on 01.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var category: String?
    @NSManaged public var date: Date?
    @NSManaged public var title: String?

}

extension Task : Identifiable {

}
