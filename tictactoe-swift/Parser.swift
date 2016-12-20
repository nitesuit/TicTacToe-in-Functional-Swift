//
//  Parser.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/12/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

struct Parser<A> {
    let parse: (String) -> Optional<(A, String)>
}

// Parsing from m-expression data which is needed for TicTacToe Game

func fromExpr() -> Parser<String> {
    return isEmpty()
        <|> manyUntil <^> expr() <*> isEnding
        ?? pure(a: "")
}



fileprivate func expr() -> Parser<String> {
    return satisfy { isPos(c: $0) }
        <> satisfy { isPos(c: $0) }
        <> satisfy { isSym(c: $0) }
}

fileprivate func isEmpty() -> Parser<String> {
    return Parser { input in
        if input != emptyExpr() {
            return .none
        }
        return ("", "")
    }
}

// Repeats the Parser until the condition

func manyUntil(p: Parser<String>) -> (_ predicate: ((String) -> Bool)?) -> Parser<String> {
    return { predicate in
        return Parser { input in
            guard let (s, remainder) = p.parse(input) else {
                print("Could not parse input")
                return (input, "")
            }
        
            if predicate!(remainder) {
                return (s, "")
            }
            
            guard
                let parser = manyUntil <^> expr() <*> isEnding,
                let (ans,_) = parser.parse(String(remainder))
                else {
                print("Could not parse input")
                return (input, "")
            }
            return (s + ans, input)
        }
    }
}

// Or

func <|> <A>(p: Parser<A>, q: Parser<A>) -> Parser<A> {
    return Parser { input in
        if let (result, input2) = p.parse(input) {
            return (result, input2)
        } else {
            return q.parse(input)
        }
    }
}


// Combining Parsers into One

func combine <A>(p: Parser<A>, b: Parser<A>) -> Parser<[A]> {
    return Parser { input in
        let (pA, pS) = p.parse(input)!
        if let (bA, bS) = b.parse(pS) {
            return ([pA, bA], bS)
        } else {
           return .none
        }
    }
}

//Functor fmap with optionals

func <^><A, B>(f: (A) -> B, a: A?) -> B? {
    switch a {
        case .some(let x): return f(x)
        case .none: return .none
    }
}

//Applicative apply with optionals

func <*><A, B>(f: ((A) -> B)?, a: A?) -> B? {
    switch f {
        case .some(let fx): return fx <^> a
        case .none: return .none
    }
}

//CCombining to String Parsers into One

func <> (p: Parser<String>, b: Parser<String>) -> Parser<String> {
   return create(p: combine(p: p, b: b))
}

//Creating Parser<String> from Parser<[String]>

func create(p: Parser<[String]>) -> Parser<String>  {
    return Parser { input in
        let (a, s) = p.parse(input)!
        return (a.reduce("", +), s)
    }
}

//Checking for the predicate

func satisfy(predicate: @escaping (String) -> Bool) -> Parser<String> {
    return Parser { input in
        guard let (head, tail) = uncons(input.characters) else {
            return (input,"")
        }
        if predicate(String(head)) {
            return (String(head), String(tail))
        }
        return satisfy(predicate: predicate).parse(String(tail))
    }
}

// Creating new parser

func pure<A>(a: A) -> Parser<A> {
    return Parser { (a, $0) }
}

//Unconstructing collection to Tuple (like in Haskell)

func uncons<C: Collection>(_ xs: C) -> Optional<(C.Iterator.Element, C.SubSequence)>
{
    if let head = xs.first {
        return (head, xs.suffix(from: xs.index(after: xs.startIndex)))
    }
    else {
        return .none
    }
}

