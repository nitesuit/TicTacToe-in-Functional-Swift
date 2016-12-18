//
//  NetworkManager.swift
//  tictactoe-swift
//
//  Created by Povilas Staskus on 12/17/16.
//  Copyright © 2016 PS. All rights reserved.
//

import Foundation

let defaultHostname = "http://tictactoe.homedir.eu/game/"
let acceptHeader = "application/m-expr+list" // accept for get Content-Type for post

func postRequest(withPath p: URL, body: String) {
    let url = p
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = body.data(using: String.Encoding.utf8)
    urlRequest.setValue(acceptHeader, forHTTPHeaderField: "Content-Type")
    
    let (_, _, error) = URLSession.shared.synchronousDataTask(with: urlRequest)
    
    guard error == nil else {
        print("Error: \(error)")
        return
    }
    print("Posting: \(body)")
}

func getRequest(withPath p: URL) -> String {
    let url = p
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    urlRequest.setValue(acceptHeader, forHTTPHeaderField: "Accept")
    
     let (data, _, error) = URLSession.shared.synchronousDataTask(with: urlRequest)
    
    guard error == nil else {
        print("Error: \(error)")
        return ""
    }
    
    let dataString = String(data: data!, encoding: String.Encoding.utf8)!
    
    print("Getting: \(dataString)")
    
    return dataString
}

func getRequestPath(gameName g: String, player p: Player) -> URL {
    let path = defaultHostname + g + "/player/" + p
    return URL(string: path)!
}
