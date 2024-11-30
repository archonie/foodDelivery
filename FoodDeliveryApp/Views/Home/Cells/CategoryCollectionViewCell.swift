//
//  CategoryCollectionViewCell.swift
//  FoodDeliveryApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 30.11.2024.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell, CardView {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.backgroundColor = .secondarySystemBackground
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.backgroundColor = .systemBackground
        initialSetup()
        contentView.layer.cornerRadius = 10
//        contentView.layer.shadowColor = UIColor.label.cgColor
//        contentView.layer.shadowOpacity = 0.1
//        contentView.layer.shadowOffset = .zero
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.height, height: contentView.height)
        label.frame = CGRect(x: imageView.right + 10, y: 5, width: contentView.width-imageView.width, height: contentView.height-10)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
    
    public func configure(with viewModel: DishCategory) {
        label.text = viewModel.title
        imageView.kf.setImage(with: viewModel.image.asUrl)
    }
}
