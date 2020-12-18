//
//  TasksViewController.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate {
    var concentrate = TasksViewConcentrate()
    var isOpenRequests = true
    @IBOutlet weak var taskTable: UITableView! {
        didSet{
            concentrate.taskTable = taskTable
        }
    }
    @IBAction func changeContent(_ sender: Any) {
        let contentNeeds: TaskState = isOpenRequests ? .open : .resolved
        isOpenRequests.toggle()
        concentrate.typeOfContent = contentNeeds
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTable.delegate = self
        taskTable.rowHeight = UITableView.automaticDimension
        taskTable.estimatedRowHeight = 1400
    }
    
    @IBAction func didPressPlusButton(_ sender: Any) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
