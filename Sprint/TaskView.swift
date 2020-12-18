//
//  TaskView.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation
import UIKit

class TaskView: UIView{
    @IBOutlet weak var taskView: UIView?
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var body: UITextView!
    init(task: Task){
        super.init(frame: .zero)
        self.getView(task: task)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.getView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //self.getView()
    }
    func setup(task: Task){
        title.text = task.name
        owner.text = "owner uid: " + String(format: "", task.owner ?? "No one")
        state.text = "Status: " + task.state.rawValue
        body.text = task.description
        
    }
    
    func getView(task: Task){
        let viewFromNib = UINib(nibName: "TaskView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? UIView
        let postView = viewFromNib!.subviews[0]
        
        postView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(postView)
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: topAnchor),
            postView.bottomAnchor.constraint(equalTo: bottomAnchor),
            postView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        setup(task: task)
    }
}
