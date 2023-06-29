//
//  ViewController.swift
//  TableAlamofire
//
//  Created by Ваня Сокол on 29.06.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var cards: [Card] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        fetchCards()
    }

    // MARK: - Setup
    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Alamofire
extension ViewController {
    func fetchCards() {
      AF.request("https://api.magicthegathering.io/v1/cards")
        .validate()
        .responseDecodable(of: Cards.self) { (response) in
            guard let cards = response.value else { return }
            self.cards = cards.cards
            print(self.cards)
            self.tableView.reloadData()
      }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell
        let card = cards[indexPath.row]
        cell?.configure(model: card)
        return cell ?? UITableViewCell()
    }
}

