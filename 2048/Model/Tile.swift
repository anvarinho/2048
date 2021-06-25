//
//  Tile.swift
//  2048
//
//  Created by Anvar Jumabaev on 10.06.21.
//

import Foundation
import SwiftUI

struct Position {
    var x: Int
    var y: Int
}

enum Direction{
    case left, right, up, down
}

struct Tile: Identifiable {
    var id = UUID().uuidString
    var position: Position
    var number: Int
    
    
}

struct Area {
    let id = UUID().uuidString
    let position: Position
    var isEmpty: Bool = false
    var tile: Tile
//    init() {
//        tile.position.x = position.x
//        tile.position.y = position.y
//    }
}
