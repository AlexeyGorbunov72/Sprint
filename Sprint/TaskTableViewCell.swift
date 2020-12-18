//
//  TaskTableViewCell.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, customString: String){
            super.init(style: style, reuseIdentifier: reuseIdentifier)

        }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTask(task: Task){
        let taskView = TaskView(task: task)
        taskView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(taskView)
        NSLayoutConstraint.activate([
            taskView.leadingAnchor.constraint(equalTo: leadingAnchor),
            taskView.trailingAnchor.constraint(equalTo: trailingAnchor),
            taskView.topAnchor.constraint(equalTo: topAnchor),
            taskView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        layoutIfNeeded()
    }
    
    
    
    
}
