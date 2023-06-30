//
//  DetailPresenter.swift
//  TableAlamofire
//
//  Created by Ivan Sokol on 30.06.2023.
//

import Foundation

protocol DetailCardView: AnyObject {
    func setCard(card: Card?)
}

protocol DetailCardViewPresenter: AnyObject {
    init(view: DetailCardView, networkServise: CardsService, card: Card?)
    func setCard()
}

class DetailCardPresenter: DetailCardViewPresenter {
    weak var view: DetailCardView?
    let networkService: CardsServiceProtocol!
    var card: Card?

    required init(view: DetailCardView, networkServise: CardsService, card: Card?) {
        self.view = view
        self.networkService = networkServise
        self.card = card
    }

    public func setCard() {
        self.view?.setCard(card: card)
    }
}
