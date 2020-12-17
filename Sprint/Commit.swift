//
//  Commit.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation

class Commit{
    var description: String
    var owner: Employee
    var addTime = Date()
    init(description: String, owner: Employee) {
        self.description = description
        self.owner = owner
    }
}
