//
//  Entities.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/17/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

typealias Player = String
typealias Board = [Position]

let x = "x"
let o = "o"

struct Coord {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func ==(lhs: Coord, rhs: Coord) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct Position {
    let x: Int
    let y: Int
    let player: Player
    
    init(x: Int, y: Int, player: Player) {
        self.x = x
        self.y = y
        self.player = player
    }
    
    func getCoord() -> Coord {
        return Coord(x: x, y: y)
    }
}

extension Coord: Equatable {}
