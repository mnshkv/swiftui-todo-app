//
//  TasksTests.swift
//  todoTests
//
//  Created by a.menshikov on 09.07.2021.
//

import XCTest
@testable import todo

class TasksTests: XCTestCase {
    var controller: PersistenceController!
    
    override func setUp() {
        super.setUp()
        controller = PersistenceController.empty
    }
    
    override func tearDown() {
        super.tearDown()
        UnitTestHelpers.deletesAllTask(container: controller.container)
    }
    
    func testAddTask() {
        let context = controller.container.viewContext
        let title = "new"
        let task = Task(title: title, context: context)
        
        XCTAssertTrue(task.title == title)
        XCTAssertNotNil(task.createdAt, "not should have a date")
    }
    
    func testUpdateTask() {
        let context = controller.container.viewContext
        let task = Task(title: "old", context: context)
        task.title = "new"
        
        XCTAssertTrue(task.title == "new")
        XCTAssertFalse(task.title == "old", "note's title not correctly updated")
    }
    
    func testFetchTasks() {
        let context = controller.container.viewContext
        let task = Task(title: "fetch me", context: context)
        let request = Task.fetch(NSPredicate.all)
        
        let fechtedTasks = try? context.fetch(request)
        
        XCTAssertTrue(fechtedTasks!.count == 1, "need to have at least one note")
        XCTAssertTrue(fechtedTasks?.first == task, "new note should be fetched")
    }
    
    func testSave() {
        expectation(forNotification: .NSManagedObjectContextDidSave, object: controller.container.viewContext) { _ in
            return true
        }
        
        controller.container.viewContext.perform {
            let task = Task(title: "title", context: self.controller.container.viewContext)
            XCTAssertNotNil(task, "note should be there")
        }
        
        waitForExpectations(timeout: 2.0) { (error) in
            XCTAssertNil(error, "saving not complete")
        }
    }
    
    func testDeleteTask() {
        let context = controller.container.viewContext
        let task = Task(title: "note to delete", context: context)
        
        Task.delete(task: task)
        
        let request = Task.fetch(.all)
        let fetchedTasks = try? context.fetch(request)
        
        XCTAssertTrue(fetchedTasks!.count == 0, "core data fetch should be empty")
        XCTAssertFalse(fetchedTasks!.contains(task), "fetch notes should not containe my deleted note")
    }
}
