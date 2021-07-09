//
//  TaskCell.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var task: Task
    
    var body: some View {
        Button(action: {
            withAnimation {
                task.done.toggle()
            }
        }, label: {
            HStack {
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(task.title)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .accessibility(identifier: "taskCellTitle")
                    
                    Text(task.createdAt, formatter: itemFormatter)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .accessibility(identifier: "taskCellCreatedAt")
                }
                
                Spacer()
                
                Image(systemName: task.done ? "checkmark.circle" : "circle")
                    .foregroundColor(.black)
                    .accessibility(identifier: "taskCellDone")
            }
        })
        .accessibility(identifier: "taskCellButton")
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {
                Task.delete(task: task)
            }, label: {
                Text("Delete")
                    .accessibility(identifier: "taskCellDeleteButton")
            })
        }))
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task(context: PersistenceController.preview.container.viewContext))
            .previewLayout(.sizeThatFits)
    }
}
