//
//  CreateTaskViewController.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UITextView!
    @IBOutlet weak var taskDescription: UITextView!
    @IBAction func pressAddTask(_ sender: UIButton) {
        TaskManager.taskManager.addTask(description: taskDescription.text, name: taskName.text)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
