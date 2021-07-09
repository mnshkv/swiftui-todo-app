//
//  Test+helper.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import Foundation
import CoreData

struct UnitTestHelpers {
    static func deletesAllTask(container: NSPersistentContainer) {
        let context = container.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: context)
    }
}
