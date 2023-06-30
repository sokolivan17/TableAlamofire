//
//  Network.swift
//  TableAlamofire
//
//  Created by Ваня Сокол on 30.06.2023.
//

import Alamofire

protocol CardsServiceProtocol {
    func getCards(callBack: @escaping ([Card]) -> Void)
}

class CardsService: CardsServiceProtocol {
    func getCards(callBack: @escaping ([Card]) -> Void) {
        var cards = [Card]()
        AF.request("https://api.magicthegathering.io/v1/cards")
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let cardsResponse = response.value else { return }
                cards = cardsResponse.cards
                callBack(cards)
            }
    }
}
