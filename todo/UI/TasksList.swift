//
//  TasksList.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import SwiftUI

struct TasksList: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(fetchRequest: Task.fetch(NSPredicate.all)) private var tasks: FetchedResults<Task>
    
    var body: some View {
        List {
            TasksSection(title: "Todo", tasks: Task.getAllUnDoneTasks(tasks))
            TasksSection(title: "Done", tasks: Task.getAllDoneTasks(tasks))
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct TasksList_Previews: PreviewProvider {
    static var previews: some View {
        TasksList()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
