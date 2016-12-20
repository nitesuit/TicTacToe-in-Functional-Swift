//
//  GameNetworkManager.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/18/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

let firstPlayer = "1"
let secondPlayer = "2"

func start(name: String, player: String) {
    switch player {
    case firstPlayer:
        attack(
            gameName: name,
            player: player,
            board: []
        )
    default:
        defend(
            gameName: name,
            player: player
        )
    }
}

func attack(gameName: String, player: String, board b: Board) {
    let nextBoard = getNextBoard(forBoard: b)
    postRequest(
        withPath: getRequestPath(gameName: gameName, player: player),
        body: fromBoardToExpr(b: nextBoard)
    )
    if isGameOver(onBoard: nextBoard) {
        if let winner = getWinner(onBoard: nextBoard) {
            print("Game Is Over. \(winner) is winner")
        } else {
            print("It is a draw")
        }
        return
    }
    defend(gameName: gameName, player: player)
}

func defend(gameName: String, player: String) {
    let response = getRequest(withPath: getRequestPath(gameName: gameName, player: player))
    let board = fromExprToBoard(s: response)
    if isGameOver(onBoard: board) {
        if let winner = getWinner(onBoard: board) {
            print("Game Is Over. \(winner) is winner")
        } else {
            print("It is a draw")
        }
        return
    }
    attack(gameName: gameName, player: player, board: board)
}
