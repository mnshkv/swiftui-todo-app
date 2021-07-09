//
//  TasksViewTestCase.swift
//  todoUITests
//
//  Created by a.menshikov on 09.07.2021.
//

import XCTest

class TasksViewTestCase: XCTestCase {
    let taskViewRobot = TasksViewRobot()
    let createTaskRobot = CreateTaskRobot()
    
    override func setUp() {
        app.launch()
        createTask()
    }
    
    func createTask() {
        createTaskRobot.tapToShowModalCreateTask()
        createTaskRobot.setTodoTitle(text: "amazing task")
        createTaskRobot.tapSaveButton()
    }
    
    func testPressDoneButton() {
        taskViewRobot.tapDoneButton()
        taskViewRobot.deleteTask()
    }
    
    func testDeleteTask() {
        taskViewRobot.deleteTask()
    }
}
