//
//  CreateTaskView.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) private var presentation
    @State private var title = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("New Todo")
                .font(.title)
                .fontWeight(.bold)
                .accessibility(identifier: "createTaskTitle")

            TextField("Todo title", text: $title)
                .accessibility(identifier: "createTaskInput")
            
            Spacer()
            
            Button(action: {
                _ = Task(title: title, context: context)
                presentation.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
                .padding()
            })
            .accessibility(identifier: "createTaskSaveButton")
        }
        .padding()
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
