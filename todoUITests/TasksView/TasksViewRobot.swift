//
//  TasksViewRobot.swift
//  todoUITests
//
//  Created by a.menshikov on 09.07.2021.
//

import XCTest

struct TasksViewRobot {
    @discardableResult
    func tapDoneButton(file: StaticString = #file, line: UInt = #line) -> Self {
        let button = TasksViewPage.Buttons.doneButton.firstMatch
        XCTAssertTrue(button.exists, "done button does not exist", file: file, line: line)
        button.tap()
        return self
    }
    
    @discardableResult
    func checkTitle(title: String) -> Self {
        let titleElement = TasksViewPage.Texts.title
        XCTAssertEqual(titleElement.label, title)
        return self
    }
    
    @discardableResult
    func deleteTask(file: StaticString = #file, line: UInt = #line) -> Self {
        let button = TasksViewPage.Buttons.doneButton.firstMatch
        XCTAssertTrue(button.exists, "done button does not exist", file: file, line: line)
        button.press(forDuration: 2)
        
        let deleteButton = app.buttons.element(matching: NSPredicate(format: "label == %@", "Delete"))
        
        XCTAssertTrue(deleteButton.exists, "delete button must exists")
        
        deleteButton.tap()
        
        return self
    }
}
