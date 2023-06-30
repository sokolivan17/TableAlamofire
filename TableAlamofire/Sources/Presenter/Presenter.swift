//
//  Presenter.swift
//  TableAlamofire
//
//  Created by Ivan Sokol on 30.06.2023.
//

import Foundation

protocol CardsView: AnyObject {
    func setCards(cards: [Card])
    func setEmptyCards()
}

class CardsPresenter {
    private let cardsService: CardsService
    weak var cardsView: CardsView?

    init(cardsService: CardsService, cardsView: CardsView) {
        self.cardsService = cardsService
        self.cardsView = cardsView
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
