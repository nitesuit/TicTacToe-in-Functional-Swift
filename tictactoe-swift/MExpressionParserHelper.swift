//
//  MExpressionHelper.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/17/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

func isEnding(s: String) -> Bool {
    return s == "\"]]"
}

func emptyExpr() -> String {
    return "l[]"
}

func isPos(c: String) -> Bool {
    return c == "0" || c == "1" || c == "2"
}

func isSym(c: String) -> Bool {
    return c == x || c == o
}
