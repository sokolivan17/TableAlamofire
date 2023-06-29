//
//  Model.swift
//  TableAlamofire
//
//  Created by Ваня Сокол on 29.06.2023.
//

import Foundation

struct Cards: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String
    let manaCost: String
    let type: String
    let rarity: String
    let setName: String
    let text: String
}
