//
//  MiniMax.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/17/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

func getMiniMaxPosition(onBoard b: Board) -> Position {
    if b.isEmpty { return GameLogicData.initialPosition }
    return performMiniMax(onBoard: b, level: 0)
        .nextPosition
}

//MARK: fileprivate func

fileprivate func getScore(forBoard b: Board) -> Int {
    guard let winner = getWinner(onBoard: b) else { return 0 }
    if winner == x {
        return 10
    } else {
        return -10
    }
}

fileprivate func miniMax(onBoard b: Board, nextPosition pos: Position, level l: Int) -> MiniMaxResult {
    if isGameOver(onBoard: b) {
        return MiniMaxResult(position: pos, level: l, score: getScore(forBoard: b))
    }
    
    let nextPositions = getAvailableNextPositions(onBoard: b, withPlayer: getNextPlayer(onBoard: b))
    let miniMaxResults = miniMaxIterate(onBoard: b, nextPositions: nextPositions, level: l)
    
    if getNextPlayer(onBoard: b) == x {
        let score = getMaximumResult(miniMaxResult: miniMaxResults).score
        let level = getMaximumResult(miniMaxResult: miniMaxResults).level

        return MiniMaxResult(position: pos, level: level, score: score)
    } else {
        let score = getMinimumResult(miniMaxResult: miniMaxResults).score
        let level = getMinimumResult(miniMaxResult: miniMaxResults).level
        return MiniMaxResult(position: pos, level: level, score: score)
    }
}

fileprivate func performMiniMax(onBoard b: Board, level l: Int) -> MiniMaxResult {
    if getNextPlayer(onBoard: b) == x {
        return getMaximumResult(
            miniMaxResult: miniMaxIterate(onBoard: b, nextPositions: getAvailableNextPositions(onBoard: b, withPlayer: x), level: l)
        )
    } else {
        return getMinimumResult(
            miniMaxResult: miniMaxIterate(onBoard: b, nextPositions: getAvailableNextPositions(onBoard: b, withPlayer: o), level: l)
        )
    }
}

fileprivate func miniMaxIterate(onBoard b: Board, nextPositions pos: [Position], level l: Int) -> [MiniMaxResult] {
    if pos.isEmpty { return [] }
    return getMiniMaxIterateResults(onBoard: b, nextPositions: pos, level: l, results: [])
}

fileprivate func getMiniMaxIterateResults(onBoard b: Board, nextPositions pos: [Position], level l: Int, results: [MiniMaxResult]) -> [MiniMaxResult] {
    if pos.isEmpty { return results }
    let (move, remainingMoves) = uncons(pos)!
    var newResults = [MiniMaxResult]()
    newResults.append(contentsOf: results)
    newResults.append(miniMax(onBoard: appendPosition(move, withBoard: b), nextPosition: move, level: l + 1))
    return getMiniMaxIterateResults(
        onBoard: b,
        nextPositions:
        [Position](remainingMoves),
        level: l + 1,
        results: newResults
    )
}

func getMaximumResult(miniMaxResult mr: [MiniMaxResult]) -> MiniMaxResult {
    let maximumScoreResults = getMaximumScoreResults(miniMaxResults: mr)
    let minimumLevel = getMinimumLevelResult(miniMaxResults: maximumScoreResults).level
    return maximumScoreResults
        .filter({ $0.level == minimumLevel })
        .first!
}

func getMinimumResult(miniMaxResult mr: [MiniMaxResult]) -> MiniMaxResult {
    let minimumScoreResults = getMinimumScoreResults(miniMaxResults: mr)
    let minimumLevel = getMinimumLevelResult(miniMaxResults: minimumScoreResults).level
    return minimumScoreResults
        .filter({ $0.level == minimumLevel })
        .first!
}


func getMinimumLevelResult(miniMaxResults mr: [MiniMaxResult]) -> MiniMaxResult {
    return mr
        .reduce(mr.first!) { (minLevelValue, miniMaxValue) in
            if miniMaxValue.level < minLevelValue.level {
                return miniMaxValue
            }
            return minLevelValue
        }
}

struct MiniMaxResult {
    let nextPosition: Position
    let level: Int
    let score: Int

    init(position p: Position, level l: Int, score s: Int) {
        self.nextPosition = p
        self.level = l
        self.score = s
    }
}

//MARK: Score calculation

func getMaximumScoreResults(miniMaxResults mr: [MiniMaxResult]) -> [MiniMaxResult] {
    let maxScore = getMaximumScoreResult(miniMaxResults: mr).score
    return mr
        .filter({ $0.score ==  maxScore})
}


func getMinimumScoreResults(miniMaxResults mr: [MiniMaxResult]) -> [MiniMaxResult] {
    let minScore = getMinimumScoreResult(miniMaxResults: mr).score
    return mr
        .filter({ $0.score ==  minScore})
}

func getMaximumScoreResult(miniMaxResults mr: [MiniMaxResult]) -> MiniMaxResult {
    return mr
        .reduce(mr.first!) { (maxScoreValue, miniMaxValue) in
            if miniMaxValue.score > maxScoreValue.score {
                return miniMaxValue
            }
            return maxScoreValue
    }
}

func getMinimumScoreResult(miniMaxResults mr: [MiniMaxResult]) -> MiniMaxResult {
    return mr
        .reduce(mr.first!) { (minScoreValue, miniMaxValue) in
            if miniMaxValue.score < minScoreValue.score {
                return miniMaxValue
            }
            return minScoreValue
    }
}
