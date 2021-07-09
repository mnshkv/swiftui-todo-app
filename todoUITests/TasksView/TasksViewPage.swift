//
//  TasksViewPage.swift
//  todoUITests
//
//  Created by a.menshikov on 09.07.2021.
//

import XCTest

enum TasksViewPage {
    enum Identifiers {
        static let taskCellTitle = "taskCellTitle"
        static let taskCellCreatedAt = "taskCellCreatedAt"
        static let taskCellDone = "taskCellDone"
        static let taskCellButton = "taskCellButton"
        static let taskCellDeleteButton = "taskCellDeleteButton"
    }
    
    enum Buttons {
        static let doneButton = app.buttons[Identifiers.taskCellButton]
    }
    
    enum Texts {
        static let title = app.staticTexts[Identifiers.taskCellTitle]
        static let createdAt = app.staticTexts[Identifiers.taskCellCreatedAt]
    }
    
    enum Images {
        static let done = app.images[Identifiers.taskCellDone]
    }
}
