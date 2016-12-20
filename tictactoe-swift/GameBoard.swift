//
//  GameBoard.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/17/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation


func fromExprToBoard(s: String) -> Board {
    /* using functor fmap on optional value */
    let board = fromExpr().parse(s)?.0 >>- toBoard
    return board ?? []
}

func fromBoardToExpr(b: Board) -> String {
    return parseFromBoardToExpr(s: "l[", b: b)
}

//MARK: fileprivate

fileprivate func toBoard(parsedString s: String) -> Board? {
    return r_toBoard(string: s, board: []) ?? []
}

fileprivate func fromPositionToExpr(p: Position) -> String {
    let x = String(p.x)
    let y = String(p.y)
    let p = p.player
    return "l[\"x\"; \(x) ; \"y\";\(y); \"v\"; \"\(p)\"]"
}

fileprivate func parseFromBoardToExpr(s: String, b: Board) -> String {
    if b.isEmpty { return s + "]"}
    guard let (head, tail) = uncons(b) else {
        return "Error unconstructing head and tail in uncons"
    }
    
    if tail.isEmpty {
        return parseFromBoardToExpr(s: s + fromPositionToExpr(p: head), b: Board(tail))
    }
    return parseFromBoardToExpr(s: s + fromPositionToExpr(p: head) + ";", b: Board(tail))
}

fileprivate func r_toBoard(string s: String, board b: Board) -> Board? {
    var board = b
    var elements = s.characters
    if elements.count == 0 {
        return b
    }
    
    let x = Int(String(elements.popFirst()!))!
    let y = Int(String(elements.popFirst()!))!
    let player = Player(elements.popFirst()!)
    
    let pos = Position(x: x, y: y, player: player)
    board.append(pos)
    board = r_toBoard(string: String(elements), board: board) ?? []
    return board
}
