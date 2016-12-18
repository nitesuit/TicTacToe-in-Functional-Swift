//
//  TestData.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/15/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

struct TestData {
    static let board1 = "l[l[\"x\"; 0;  \"y\"; 0; \"v\";  \"o\"];l[\"x\"; 0;  \"y\"; 1; \"v\";  \"x\"];l[\"x\"; 1;  \"y\"; 1; \"v\";  \"x\"]]"
    static let board2 = "l[l[\"x\"; 0;  \"y\"; 1; \"v\";  \"o\"];l[\"x\"; 2;  \"y\"; 1; \"v\";  \"x\"];l[\"x\"; 1;  \"y\"; 2; \"v\";  \"x\"]]"
    static let boardWinnerO = "l[l[\"x\";  1; \"y\"; 0;  \"v\";  \"x\"]; l[\"x\"; 2; \"y\"; 1; \"v\"; \"o\"]; l[\"x\"; 1;   \"y\";   1; \"v\";   \"x\"];   l[\"x\"; 1;  \"y\";   2;  \"v\"; \"o\"];  l[\"x\";   0;  \"y\";  1;  \"v\";  \"x\"];   l[\"x\";   0;  \"y\";   2; \"v\";  \"o\"];  l[\"x\";  0;  \"y\";   0;   \"v\";  \"x\"]; l[\"x\";   2;  \"y\";   2;   \"v\";  \"o\"]]"

    static let boardWinnerX = "l[l[\"x\";  1;   \"y\";  0; \"v\";  \"x\"]; l[\"x\";  1; \"y\"; 1;  \"v\"; \"o\"];   l[\"x\";  1;   \"y\";   2;  \"v\";   \"x\"];   l[\"x\"; 0; \"y\"; 0; \"v\"; \"o\"];   l[\"x\";   2;   \"y\";   2;   \"v\";  \"x\"];  l[\"x\";   2;  \"y\"; 0;  \"v\";   \"o\"];   l[\"x\";  0;  \"y\"; 2;   \"v\"; \"x\"]]"
    static let boardDraw = "l[l[\"x\";   2;  \"y\"; 1;   \"v\";   \"x\"];  l[\"x\";  1;  \"y\";  0;   \"v\";  \"o\"]; l[\"x\"; 1;  \"y\";  1; \"v\"; \"x\"];  l[\"x\";  2;   \"y\"; 0;   \"v\";   \"o\"];   l[\"x\";   0;   \"y\";   2; \"v\";   \"x\"];   l[\"x\";  2;   \"y\";  2;  \"v\";  \"o\"];   l[\"x\";  0;   \"y\"; 0; \"v\";   \"x\"];  l[\"x\";  0;  \"y\"; 1;  \"v\"; \"o\"]; l[\"x\";   1;  \"y\";  2;  \"v\";  \"x\"]]"
    static let boardMinMax = "l[l[\"x\";  0;   \"y\"; 0; \"v\"; \"o\"];   l[\"x\";   0; \"y\";  1;  \"v\";   \"x\"];  l[\"x\"; 0; \"y\";   2;   \"v\";   \"x\"];   l[\"x\";   2; \"y\"; 0;   \"v\";  \"x\"];  l[\"x\"; 1; \"y\"; 2; \"v\";  \"o\"]; l[\"x\";   2; \"y\";   2;  \"v\";   \"o\"]]"
    static let board5 = "l[l[\"x\"; 0;  \"y\"; 0; \"v\";  \"o\"];l[\"x\"; 0;  \"y\"; 1; \"v\";  \"x\"];l[\"x\"; 1;  \"y\"; 1; \"v\";  \"x\"]]"

    static let coord1 = Coord(x: 0, y: 1)
    static let coord2 = Coord(x: 1, y: 1)
    static let coord3 = Coord(x: 2, y: 2)
    static let emptyBoard = "l[]"
}

