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
    init(root: PromotedEmployee?) {
        self.root = root
        queue += root?.subordinates ?? []
    }
    
    mutating func next() -> Employee? {
        if queue.isEmpty{
            return nil
        }
        defer { queue.removeFirst() }
        if let promoted = queue[0] as? PromotedEmployee{
            queue += promoted.subordinates ?? []
        }
        return queue[0]
    }
}
