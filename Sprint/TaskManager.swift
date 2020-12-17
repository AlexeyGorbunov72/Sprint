//
//  TaskManager.swift
//  Sprint
//
//  Created by Alexey on 17.12.2020.
//

import Foundation

class TaskManager{
    private var storage: [TaskState: [Task]] = [.active: [],
                                                .open: [],
                                                .resolved: []]
    
    func addTask(description: String, name: String){
        let newTask = Task(description: description, name: name)
        storage[.open]?.append(newTask)
    }
    func addComment(description: String, taskUID: Int, commentatorUID: Int){
        let task = findTaskByUID(taskUID: taskUID)
        task?.addComment(text: description, commentOwner: commentatorUID)
    }
    
    func changeStateTask(taskUID: Int, to state: TaskState){
        let taskIterator = TasksIterator(storage)
        var taskToChange: Task?
        for task in taskIterator{
            if task.uid == taskUID{
                taskToChange = task
                break
            }
        }
        guard let taskToChangeUnwarped = taskToChange else {
            return
        }
        storage[state]?.removeAll(where: { $0.uid == taskUID })
        taskToChangeUnwarped.changeState(to: state)
        storage[state]?.append(taskToChangeUnwarped)
        
    }
    func changeOwner(taskUID: Int, to owner: Employee){
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
            if task.owner?.UID == employee.UID{
                tasks.append(task)
            }
        }
        return tasks
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
