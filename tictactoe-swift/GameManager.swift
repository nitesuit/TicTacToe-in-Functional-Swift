//
//  GameManager.swift
//
//  Created by Povilas Staskus on 12/17/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

//MARK: Game Movement Logic

func getNextPosition(onBoard b: Board) -> Position {
    if b.isEmpty { return GameLogicData.initialPosition }
    return getMiniMaxPosition(onBoard: b)
}

func getNextBoard(forBoard b: Board) -> Board {
    return appendPosition(
        getNextPosition(onBoard: b),
        withBoard: b
    )
}

func getAvailableNextPositions(onBoard b: Board, withPlayer p: Player) -> [Position] {
    return getAvailableNextCoords(onBoard: b)
        .reduce([Position]()) {
            var pos = [Position]()
            pos.append(contentsOf: $0.0)
            pos.append(Position(x: $0.1.x, y: $0.1.y, player: p))
            return pos
    }
}

func getAvailableNextBoards(onBoard b: Board) -> [Board] {
    return getAvailableNextPositions(onBoard: b, withPlayer: getNextPlayer(onBoard: b))
        .reduce([Board]()) {
            var boards = [Board]()
            boards.append(contentsOf: $0.0)
            boards.append(appendPosition($0.1, withBoard: b))
            return boards
    }
}

func getAvailableNextCoords(onBoard b: Board) -> [Coord] {
    return GameLogicData.board
        .filter({ !getCoords(fromBoard: b).contains($0) })
}

func getNextPlayer(onBoard b: Board) -> Player {
    if countPlayer(x, onBoard: b) == countPlayer(o, onBoard: b) + 1 {
        return o
    } else {
        return x
    }
}

func appendPosition(_ p: Position, withBoard b: Board) -> Board {
    var board = Board()
    board.append(p)
    board.append(contentsOf: b)
    return board
}

//MARK: Game Validation Logic

func isGameOver(onBoard b: Board) -> Bool {
    if b.isEmpty { return false }
    return getWinner(onBoard: b) != .none
        || b.count == GameLogicData.maximumPositions
}

func isPlayerWinner(_ player: Player, onBoard b: Board) -> Bool {
    if b.isEmpty { return false }
    return GameLogicData.winningCoords()
        .filter({ playerExistsAtCoords($0, onBoard: b, player: player) })
        .isNotEmpty
}

func getWinner(onBoard b: Board) -> Player? {
    if b.isEmpty { return .none }
    if isPlayerWinner(x, onBoard: b) { return x }
    if isPlayerWinner(o, onBoard: b) { return o }
    return .none
}

func playerExistsAtCoords(_ c: [Coord], onBoard b: Board, player p: Player) -> Bool {
    return c
        .filter({ playerExistsAtCoord($0, onBoard: b, player: p) })
        .count == c.count
}

func playerExistsAtCoord(_ c: Coord, onBoard b: Board, player p: Player) -> Bool {
    return b
        .filter({ $0.getCoord() == c  && $0.player == p })
        .isNotEmpty
}

func countPlayer(_ p: Player, onBoard b: Board) -> Int {
    return b
        .filter({ $0.player == p })
        .count
}

//MARK: fileprivate

fileprivate func getCoords(fromBoard b: Board) -> [Coord] {
    return b
        .reduce([]) { (coords, pos) in
            var c = [Coord]()
            c.append(contentsOf: coords)
            c.append(pos.getCoord())
            return c
    }
}
