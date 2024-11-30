//
//  CardView.swift
//  FoodDeliveryApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 30.11.2024.
//

import UIKit

protocol CardView: UIView {
    func initialSetup()
}

extension CardView {
    func initialSetup() {
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
        layer.shadowColor = UIColor.label.cgColor
    }
}
