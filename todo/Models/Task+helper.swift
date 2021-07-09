//
//  Task+helper.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import Foundation
import CoreData
import SwiftUI

extension Task {
    convenience init(title: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.createdAt = Date()
        self.done = false
        
        try? context.save()
    }
    
    var title: String {
        get { return title_ ?? "" }
        set {
            title_ = newValue
            if let conxtext = self.managedObjectContext {
                try? conxtext.save()
            }
        }
    }
    
    var createdAt: Date {
        get { return createdAt_ ?? Date() }
        set { return createdAt_ = newValue }
    }
    
    var done: Bool {
        get { return done_ }
        set {
            done_ = newValue
            if let conxtext = self.managedObjectContext {
                try? conxtext.save()
            }
        }
    }
    
    static func fetch(_ predicate: NSPredicate)  -> NSFetchRequest<Task> {
        let request = NSFetchRequest<Task>(entityName: "Task")
        
        request.sortDescriptors = [NSSortDescriptor(key: TaskProperties.createdAt, ascending: false)]
        request.predicate = predicate
        
        return request
    }
    
    static func getAllUnDoneTasks(_ tasks: FetchedResults<Task>) -> [Task] {
        return tasks.filter({ !$0.done })
    }
    
    static func getAllDoneTasks(_ tasks: FetchedResults<Task>) -> [Task] {
        return tasks.filter({ $0.done })
    }
    
    static func delete(task: Task) {
        if let context = task.managedObjectContext {
            context.delete(task)
            try? context.save()
        }
    }
}

struct TaskProperties {
    static let createdAt = "createdAt_"
    static let title = "title_"
    static let done = "done_"
}
