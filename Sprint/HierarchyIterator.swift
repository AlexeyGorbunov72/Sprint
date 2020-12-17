//
//  HierarchyIterator.swift
//  Sprint
//
//  Created by Alexey on 17.12.2020.
//

import Foundation

struct HierarchyIterator: Sequence, IteratorProtocol {
    weak var root: Employee?
    private var queue: [Employee] = []
    init(root: Employee?) {
        self.root = root
        queue += root?.slaves ?? []
    }
    
    mutating func next() -> Employee? {
        if queue.isEmpty{
            return nil
        }
        defer { queue.removeFirst() }
        queue += queue[0].slaves ?? []
        return queue[0]
    }
}
