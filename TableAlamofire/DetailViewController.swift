//
//  DetailViewController.swift
//  TableAlamofire
//
//  Created by Ваня Сокол on 29.06.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var card: Card?

    lazy var type: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var rarity: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var setName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHierarcy()
        setupLayout()
        configure(model: card)
    }

    // MARK: - Setup
    private func setupHierarcy() {
        view.addSubview(type)
        view.addSubview(rarity)
        view.addSubview(setName)
        view.addSubview(text)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            type.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            type.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            type.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

            rarity.topAnchor.constraint(equalToSystemSpacingBelow: type.bottomAnchor, multiplier: 2),
            rarity.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            rarity.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

            setName.topAnchor.constraint(equalToSystemSpacingBelow: rarity.bottomAnchor, multiplier: 2),
            setName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            setName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

            text.topAnchor.constraint(equalToSystemSpacingBelow: setName.bottomAnchor, multiplier: 2),
            text.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            text.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
        ])
    }

    // MARK: - Configure
    private func configure(model: Card?) {
        type.text = "Type: \(model?.text ?? "Unknowned")"
        rarity.text = "Rarity: \(model?.rarity ?? "Unknowned")"
        setName.text = "Set name: \(model?.text ?? "Unknowned")"
        text.text = "\(model?.text ?? "Unknowned")"
    }
}