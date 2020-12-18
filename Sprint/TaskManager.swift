//
//  TaskManager.swift
//  Sprint
//
//  Created by Alexey on 17.12.2020.
//

import Foundation

class TaskManager{
    static let taskManager = TaskManager()
    private var storage: [Task] = []
    func addTask(description: String, name: String){
        let newTask = Task(description: description, name: name)
        storage.append(newTask)
    }
    func addComment(description: String, taskUID: Int, commentatorUID: Int){
        let task = findTaskByUID(taskUID: taskUID)
        task?.addComment(text: description, commentOwner: commentatorUID)
    }
    
    func changeStateTask(taskUID: Int, to state: TaskState){
        let taskToChange = findTaskByUID(taskUID: taskUID)
        guard let taskToChangeUnwarped = taskToChange else {
            return
        }
        taskToChangeUnwarped.changeState(to: state)
    }
    
    func changeOwner(taskUID: Int, to owner: Int){
        let task = findTaskByUID(taskUID: taskUID)
        task?.changeOwner(to: owner)
    }
    
    func findTaskByUID(taskUID: Int) -> Task?{
        let taskIterator = TasksIterator(storage)
        for task in taskIterator{
            if task.uid == taskUID{
                return task
            }
        }
        return nil
    }
    func findTasksConnected(to employee: Employee) -> [Task]{
        let taskIterator = TasksIterator(storage)
        var tasks: [Task] = []
        for task in taskIterator{
            if task.owner == employee.UID{
                tasks.append(task)
            }
        }
        return tasks
    }
    
    func freeTask(taskUID: Int){
        let task = findTaskByUID(taskUID: taskUID)
        task?.setFree()
    }
    
    func findTasksWithContribyte(by employee: Employee) -> [Task]{
        let taskIterator = TasksIterator(storage)
        var tasks: [Task] = []
        for task in taskIterator{
            if task.isContributor(employee: employee){
                tasks.append(task)
            }
        }
        return tasks
    }
    
    func findTaskByDateChange(date: Date) -> Task?{
        let taskIterator = TasksIterator(storage)
        for task in taskIterator{
            if task.lastTimeOfChange == date{
                return task
            }
        }
        return nil
    }
    
    func findTaskByDateCreate(date: Date) -> Task?{
        let taskIterator = TasksIterator(storage)
        for task in taskIterator{
            if task.dateOfCreation == date{
                return task
            }
        }
        return nil
    }
    
}
extension TaskManager: TaskDataSource{
    func getTasks(types: TaskState...) -> [Task] {
        var response: [Task] = []
        let taskIterator = TasksIterator(storage)
        for task in taskIterator{
            for type in types{
                if task.state == type{
                    response.append(task)
                }
            }
        }
        return response
    }
}
protocol TaskDataSource {
    func getTasks(types: TaskState...) -> [Task]
}
