//
//  HomeData.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 19/01/23.
//

import UIKit

// Decodable: decodifica, transforma um Json em um objeto
// Encodable: codifica um objeto, ou seja, tornar um tipo de dado no Swift em Json
// Codable: Codifica e decodifica

struct HomeData: Codable {
    var stories: [Story]?
    var posts: [Post]?
}
