//
//  LikeCommand.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation

class LikeCommand: Command{
    private var userUID: Int
    private var task: Task
    init(task: Task, userUID: Int) {
        self.task = task
        self.userUID = userUID
    }
    func execute() {
        TaskManager.taskManager.changeOwner(taskUID: task.uid, to: userUID)
    }
    
    func undo() {
        // do shit
    }
    
}
