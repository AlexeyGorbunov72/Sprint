//
//  Command.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation
protocol Command{
    func execute()
    func undo()
}
