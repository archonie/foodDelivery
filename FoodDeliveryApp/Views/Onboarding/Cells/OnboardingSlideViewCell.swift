//
//  OnboardingSlideViewCell.swift
//  FoodDeliveryApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 27.11.2024.
//

import UIKit

class OnboardingSlideViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingSlideViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Quick Delivery At Your Doorstep"
        label.textAlignment = .center
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Home delivery and Online reservation system for restaurants and cafes."
        label.textAlignment = .center
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.width, height: contentView.height-120)
        titleLabel.frame = CGRect(x: 15, y: imageView.bottom+10, width: contentView.width-30, height: 40)
        descriptionLabel.frame = CGRect(x: 15, y: titleLabel.bottom+10, width: contentView.width-30, height: 60)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with slide: OnboardingSlide) {
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
        imageView.image = slide.image
    }
    
    private func configureSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
    }
    
    
}
