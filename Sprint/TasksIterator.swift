//
//  TasksIterator.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import Foundation
struct TasksIterator: Sequence, IteratorProtocol {
    private var queue: [Task] = []
    init(_ root: [TaskState: [Task]]?) {
        guard let root = root else {
            return
        }
        for type in TaskState.allCases{
            for task in root[type]!{
                queue.append(task)
            }
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
