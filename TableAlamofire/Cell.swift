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
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            name.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            manaCost.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            manaCost.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
    }

    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        manaCost.text = nil
    }

    public func configure(model: Card?) {
        name.text = "\(model?.name ?? "Unknowned")"
        manaCost.text = "\(model?.manaCost ?? "Unknowned")"
    }
}
