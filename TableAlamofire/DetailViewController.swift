//
//  DetailViewController.swift
//  TableAlamofire
//
//  Created by Ваня Сокол on 29.06.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    var card: Card?

    private lazy var name = makeLabel(ofSize: 20, weight: .medium)
    private lazy var type = makeLabel(weight: .regular)
    private lazy var rarity = makeLabel(weight: .regular)
    private lazy var setName = makeLabel(weight: .regular)
    private lazy var text = makeLabel(weight: .light, numberOfLines: 0)

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Card details"
        view.backgroundColor = .systemBackground
        setupHierarcy()
        setupLayout()
        configure()
    }

    // MARK: - Setup
    private func setupHierarcy() {
        view.addSubview(stackView)
    }

    private func setupLayout() {
        let labels = [name, type, rarity, setName, text]
        labels.forEach { stackView.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500)
        ])
    }

    // MARK: - Configure
    private func configure() {
        name.text = "Name: \(card?.name ?? "Unknowned")"
        type.text = "Type: \(card?.type ?? "Unknowned")"
        rarity.text = "Rarity: \(card?.rarity ?? "Unknowned")"
        setName.text = "Set name: \(card?.setName ?? "Unknowned")"
        text.text = "Description: \(card?.text ?? "Unknowned")"
    }
}


