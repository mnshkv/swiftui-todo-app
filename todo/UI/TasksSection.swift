//
//  TasksSection.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import SwiftUI

struct TasksSection: View {
    var title: String
    var tasks: [Task]
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(tasks) { task in
                TaskCell(task: task)
            }
        }
    }
}

struct TasksSection_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let request = Task.fetch(NSPredicate.all)
        let fechtedTasks = try? context.fetch(request)
        
        return (
            List {
                TasksSection(title: "Todo", tasks: fechtedTasks ?? [])
                TasksSection(title: "Done", tasks: fechtedTasks ?? [])
            }
            .listStyle(InsetGroupedListStyle())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        )
    }
}
