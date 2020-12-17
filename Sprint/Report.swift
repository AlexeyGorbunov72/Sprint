//
//  Report.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation

class Report: Commit{
    var content: String = ""
    override init(description: String, owner: Employee) {
        super.init(description: description, owner: owner)
    }
    
}
