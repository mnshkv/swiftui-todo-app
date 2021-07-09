//
//  ContentView.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TasksView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
