//
//  HomeCollectionViewCell.swift
//  FoodDeliveryApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 28.11.2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
  
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.text = "Food Category"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 16, y: 16, width: contentView.width, height: 30)
        collectionView.frame = CGRect(x: 0, y: titleLabel.bottom, width: contentView.width, height: contentView.height-titleLabel.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    func configure(with viewModel: HomeCard) {
        titleLabel.text = viewModel.title
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
    }
    
}
