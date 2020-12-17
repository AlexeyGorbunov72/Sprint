//
//  Task.swift
//  Sprint
//
//  Created by Alexey on 17.12.2020.
//

import Foundation
class Task{
    private(set) var name: String {
        didSet{
            lastTimeOfChange = Date()
        }
    }
    private(set) var description: String = "" {
        didSet{
            lastTimeOfChange = Date()
        }
    }
    private(set) var commits: [Commit] = [] {
        didSet{
            lastTimeOfChange = Date()
        }
    }
    private static var globalUID: Int = -1
    private(set) var state: TaskState = .open
    private(set) weak var owner: Employee?
    private(set) var lastTimeOfChange: Date = Date()
    private(set) var dateOfCreation: Date = Date()
    private(set) lazy var uid = genereteUID()
    private(set) var comments: [Comment] = []
    init(description: String, name: String) {
        self.description = description
        self.name = name
    }
    private func genereteUID() -> Int{
        Task.globalUID += 1
        return Task.globalUID
    }

    func changeState(to state: TaskState){
        self.state = state
    }
    
    func changeOwner(to owner: Employee){
        self.owner = owner
    }
    
    func addComment(text: String, commentOwner: Int){
        comments.append(Comment(text: text, ownerUID: commentOwner))
    }
    
    func isContributor(employee: Employee) -> Bool{
        for commit in commits{
            if commit.owner.UID == employee.UID{
                return true
            }
        }
        return false
    }
    
}
enum TaskState: CaseIterable{
    case open
    case active
    case resolved
}
