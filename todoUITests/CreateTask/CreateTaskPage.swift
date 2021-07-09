//
//  CreateTaskPage.swift
//  todoUITests
//
//  Created by a.menshikov on 09.07.2021.
//

import XCTest

enum CreateTaskPage {
    enum Identifiers {
        static let createTaskTitle = "createTaskTitle"
        static let createTaskInput = "createTaskInput"
        static let createTaskSaveButton = "createTaskSaveButton"
        static let tasksViewAddTaskButton = "tasksViewAddTaskButton"
    }
    
    enum Buttons {
        static let saveButton = app.buttons[Identifiers.createTaskSaveButton]
    }
    
    enum Texts {
        static let title = app.staticTexts[Identifiers.createTaskTitle]
    }
    
    enum NavigationBars {
        static let showModal = app.navigationBars.element.buttons.element
    }
    
    enum TextFields {
        static let title = app.textFields[Identifiers.createTaskInput]
    }
}
