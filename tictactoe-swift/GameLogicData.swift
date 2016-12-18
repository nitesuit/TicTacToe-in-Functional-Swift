//
//  GameLogicData.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/17/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

struct GameLogicData {
    
    static let board: [Coord] = [
        Coord(x: 0, y: 0), Coord(x: 1, y: 0), Coord(x: 2, y: 0),
        Coord(x: 0, y: 1), Coord(x: 1, y: 1), Coord(x: 2, y: 1),
        Coord(x: 0, y: 2), Coord(x: 1, y: 2), Coord(x: 2, y: 2)
    ]
    
    static let firstRow: [Coord] = [Coord(x: 0, y: 0), Coord(x: 1, y: 0), Coord(x: 2, y: 0)]
    static let secondRow: [Coord] = [Coord(x: 0, y: 1), Coord(x: 1, y: 1), Coord(x: 2, y: 1)]
    static let thirdRow: [Coord] = [Coord(x: 0, y: 2), Coord(x: 1, y: 2), Coord(x: 2, y: 2)]
    static let firstCol: [Coord] = [Coord(x: 0, y: 0), Coord(x: 0, y: 1), Coord(x: 0, y: 2)]
    static let secondCol: [Coord] = [Coord(x: 1, y: 0), Coord(x: 1, y: 1), Coord(x: 1, y: 2)]
    static let thirdCol: [Coord] = [Coord(x: 2, y: 0), Coord(x: 2, y: 1), Coord(x: 2, y: 2)]
    static let firstDiag: [Coord] = [Coord(x: 0, y: 0), Coord(x: 1, y: 1), Coord(x: 2, y: 2)]
    static let secondDiag: [Coord] = [Coord(x: 0, y: 2), Coord(x: 1, y: 1), Coord(x: 2, y: 0)]
    static func winningCoords() -> [[Coord]] {
        return [firstRow, secondRow, thirdRow, firstCol, secondCol, thirdCol, firstDiag, secondDiag]
    }
    static let maximumPositions = 9
    static let initialPosition = Position(x: 1, y: 1, player: x)
 }

