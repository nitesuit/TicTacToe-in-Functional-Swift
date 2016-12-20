//
//  Operators.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/18/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

infix operator <|> : ComparisonPrecedence // or

infix operator <> : AdditionPrecedence // append

infix operator <^> : FunctorPrecedence // map

infix operator <*> : FunctorPrecedence // apply wrapped func to wrapped value

infix operator >>- : FunctorPrecedence // monad fmap

precedencegroup FunctorPrecedence {
    associativity: left
    higherThan: NilCoalescingPrecedence
}


