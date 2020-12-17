//
//  Comment.swift
//  Sprint
//
//  Created by Alexey on 17.12.2020.
//

import Foundation

class Comment{
    var ownerUID: Int
    var text: String
    var timeOfCreation: Date = Date()
    init(text: String, ownerUID: Int) {
        self.text = text
        self.ownerUID = ownerUID
    }
}
