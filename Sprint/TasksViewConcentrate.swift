//
//  TasksViewConcentrate.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation
import UIKit
class TasksViewConcentrate: NSObject, UITableViewDataSource{
    var typeOfContent: TaskState? {
        didSet{
            updateTable()
        }
    }
    var taskTable: UITableView?{
           didSet{
            taskTable!.dataSource = self
            taskTable!.register(TaskTableViewCell.self, forCellReuseIdentifier: "taskCell")
           }
       }
    var tasks: [Task] = {
        let taskSource = TaskManager.taskManager as TaskDataSource
        return taskSource.getTasks(types: .open)
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    func updateTable(){
        let taskSource = TaskManager.taskManager as TaskDataSource
        tasks = taskSource.getTasks(types: typeOfContent ?? .open)
        taskTable?.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell = taskTable!
                    .dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        taskCell.addTask(task: tasks[indexPath.row])
        return taskCell
    }
    
    
    
    
}
