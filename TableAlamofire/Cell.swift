//
//  Cell.swift
//  TableAlamofire
//
//  Created by Ваня Сокол on 29.06.2023.
//

import UIKit

class Cell: UITableViewCell {

    static var identifier = "Cell"

    // MARK: - Properties
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var manaCost: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
//        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
        contentView.clipsToBounds = true
        setupHierarcy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupHierarcy() {
        addSubview(name)
        addSubview(manaCost)
//        addSubview(type)
//        addSubview(rarity)
//        addSubview(setName)
//        addSubview(text)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            name.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            manaCost.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            manaCost.topAnchor.constraint(equalTo: topAnchor, constant: 10),

//            type.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
//            type.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
//
//            rarity.topAnchor.constraint(equalTo: type.bottomAnchor, constant: 10),
//            rarity.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
//
//            setName.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
//            setName.centerYAnchor.constraint(equalTo: rarity.centerYAnchor),
//
//            text.topAnchor.constraint(equalTo: rarity.bottomAnchor, constant: 10),
//            text.leftAnchor.constraint(equalTo: leftAnchor,constant: 10),
//            text.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }

    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        manaCost.text = nil
//        type.text = nil
//        rarity.text = nil
//        setName.text = nil
//        text.text = nil
    }

    public func configure(model: Card?) {
        name.text = "\(model?.name ?? "Unknowned")"
        manaCost.text = "\(model?.manaCost ?? "Unknowned")"
//        type.text = "Type: \(model?.text ?? "Unknowned")"
//        rarity.text = "Rarity: \(model?.rarity ?? "Unknowned")"
//        setName.text = "Set name: \(model?.text ?? "Unknowned")"
//        text.text = "\(model?.text ?? "Unknowned")"
    }
}
