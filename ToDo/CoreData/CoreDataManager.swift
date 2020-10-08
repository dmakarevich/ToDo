//
//  CoreDataManager.swift
//  ToDo
//
//  Created by Dmitry Makarevich on 01.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext(context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchEntities<T: NSManagedObject>(fetch: NSFetchRequest<T>) -> [T] {
        var tasks: [T] = []
        let managedContext = self.persistentContainer.viewContext
        do {
            tasks = try managedContext.fetch(fetch)
        } catch {
            print(error.localizedDescription)
        }

        return tasks
    }
}
