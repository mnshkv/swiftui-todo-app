//
//  TasksView.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import SwiftUI

struct TasksView: View {
    @State private var showCreateModal = false
    
    var body: some View {
        NavigationView {
            TasksList()
                .navigationTitle("Tasks")
                .accessibility(identifier: "TasksViewList")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showCreateModal.toggle()
                        }, label: {
                            Image(systemName: "plus.circle")
                        })
                    }
                })
                .sheet(isPresented: $showCreateModal, content: {
                    CreateTaskView()
                })
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
