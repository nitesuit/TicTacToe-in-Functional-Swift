//
//  MenuView.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/18/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

func showMenu() -> (String, String) {
    print("Hi! Enter the name of the game: ")
    let name = readLine(strippingNewline: true)!
    print("Player: ")
    let player = readLine(strippingNewline: true)!
    
    return (name, player)
}
