//
//  Factories.swift
//  TableAlamofire
//
//  Created by Ваня Сокол on 30.06.2023.
//

import UIKit

func makeLabel(ofSize:  CGFloat = 16,
               weight: UIFont.Weight,
               textAlignment: NSTextAlignment = .left,
               numberOfLines: Int = 1) -> UILabel {
    let label = UILabel()
    label.font = .systemFont(ofSize: ofSize, weight: weight)
    label.textAlignment = textAlignment
    label.numberOfLines = numberOfLines
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}
