//
//  CreateTaskTestCase.swift
//  todoUITests
//
//  Created by a.menshikov on 09.07.2021.
//

import XCTest

class CreateTaskTestCase: XCTestCase {
    let createTaskRobot = CreateTaskRobot()
    let taskViewRobot = TasksViewRobot()
    
    override func setUp() {
        app.launch()
        createTaskRobot.tapToShowModalCreateTask()
    }
    
    func testCheckTitle() {
        createTaskRobot.checkTitle(title: "New Todo")
    }
    
    func testSetTodoTitle() {
        createTaskRobot.setTodoTitle(text: "some task")
    }
    
    func testCreateTask() {
        createTaskRobot.setTodoTitle(text: "test task")
        createTaskRobot.tapSaveButton()
        taskViewRobot.tapDoneButton()
    }
}
