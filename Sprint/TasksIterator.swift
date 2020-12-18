//
//  TasksIterator.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation
struct TasksIterator: Sequence, IteratorProtocol {
    private var queue: [Task] = []
    init(_ root: [Task]) {
        for task in root{
                queue.append(task)
        }
    }
    
    mutating func next() -> Task? {
        if queue.isEmpty{
            return nil
        }
        defer { queue.removeFirst() }
        return queue[0]
    }
}
