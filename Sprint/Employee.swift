//
//  Employee.swift
//  Sprint
//
//  Created by Alexey on 17.12.2020.
//

import Foundation
class Employee{
    private(set) var UID: Int = 0
    private(set) var master: Employee?
    private(set) var name: String
    init(name: String) {
        self.name = name
    }
    func setMaster(_ master: Employee){
        self.master = master
    }
    
}
