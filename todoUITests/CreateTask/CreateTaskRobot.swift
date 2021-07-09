//
//  CreateTaskRobot.swift
//  todoUITests
//
//  Created by a.menshikov on 09.07.2021.
//

import XCTest

struct CreateTaskRobot {
    @discardableResult
    func tapSaveButton(file: StaticString = #file, line: UInt = #line) -> Self {
        let button = CreateTaskPage.Buttons.saveButton
        XCTAssertTrue(button.exists, "save button does not exist", file: file, line: line)
        button.tap()
        return self
    }
    
    @discardableResult
    func checkTitle(title: String) -> Self {
        let titleElement = CreateTaskPage.Texts.title
        XCTAssertEqual(titleElement.label, title)
        return self
    }
    
    @discardableResult
    func setTodoTitle(text: String, file: StaticString = #file, line: UInt = #line) -> Self {
        let title = CreateTaskPage.TextFields.title
        XCTAssertTrue(title.exists, "text field don't exists", file: file, line: line)
        
        title.tap()
        text.forEach { char in
            title.typeText(String(char))
        }
        
        XCTAssertEqual(title.value as! String, text)
        
        return self
    }
    
    
    @discardableResult
    func tapToShowModalCreateTask(file: StaticString = #file, line: UInt = #line) -> Self {
        let button = CreateTaskPage.NavigationBars.showModal
        XCTAssertTrue(button.exists, "save button does not exist", file: file, line: line)
        button.tap()
        return self
    }
}
