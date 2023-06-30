//
//  MainPresenter.swift
//  TableAlamofire
//
//  Created by Ivan Sokol on 30.06.2023.
//

import Foundation

protocol CardsView: AnyObject {
    func setCards(cards: [Card])
    func setEmptyCards()
}

protocol MainCardsViewPresenter: AnyObject {
    init(view: CardsView, networkService: CardsServiceProtocol)
    func getCards()
}

class CardsPresenter: MainCardsViewPresenter {
    private let cardsService: CardsServiceProtocol
    weak var cardsView: CardsView?

    required init(view: CardsView, networkService: CardsServiceProtocol) {
        self.cardsService = networkService
        self.cardsView = view
    }

    func getCards() {
        cardsService.getCards { [weak self] cards in
            if cards.isEmpty {
                self?.cardsView?.setEmptyCards()
            } else {
                self?.cardsView?.setCards(cards: cards)
            }
        }
    }
}
