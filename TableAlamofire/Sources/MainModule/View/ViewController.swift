//
//  ViewController.swift
//  TableAlamofire
//
//  Created by Ivan Sokol on 29.06.2023.
//

import UIKit

final class ViewController: UIViewController {
    lazy var cardsPresenter = CardsPresenter(view: self, networkService: CardsService())
    var cardsToDisplay: [Card] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cards"
        view.backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
        cardsPresenter.getCards()
    }

    // MARK: - Setup
    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsToDisplay.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell
        let card = cardsToDisplay[indexPath.row]
        cell?.configure(model: card)
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let card = cardsToDisplay[indexPath.row]

        let viewController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.card = card
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ViewController: CardsView {
    func setCards(cards: [Card]) {
        cardsToDisplay = cards
        tableView.reloadData()
    }

    func setEmptyCards() {
        view.backgroundColor = .systemRed
        tableView.isHidden = true
    }
}

