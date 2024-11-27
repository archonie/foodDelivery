//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 27.11.2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    private var slides = [
        OnboardingSlide(title: "Quick Delivery at Your Doorstep", description: "Home delivery and Online reservation system for restaurants and cafes.", image: UIImage(named: "slide1")!),
        OnboardingSlide(title: "Easy Payments", description: "Make payments easily with integrated systems.", image: UIImage(named:"slide2")!),
        OnboardingSlide(title: "Track Your Orders", description: "Real-time tracking of your deliveries.", image: UIImage(named:"slide3")!)
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(OnboardingSlideViewCell.self, forCellWithReuseIdentifier: OnboardingSlideViewCell.identifier)
        return collectionView
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .secondaryLabel
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor(named: "tintColor")
        pageControl.pageIndicatorTintColor = .tertiaryLabel
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 120
        )
        pageControl.frame = CGRect(
            x: (view.width - 100) / 2,
            y: collectionView.bottom + 10,
            width: 100,
            height: 50
        )
        nextButton.frame = CGRect(
            x: (view.width - 150) / 2,
            y: pageControl.bottom + 10,
            width: 150,
            height: 50
        )
    }
    
    private func configureViews() {
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        collectionView.delegate = self
        collectionView.dataSource = self
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    }
    
    @objc private func didTapNext() {
        let nextIndex = min(pageControl.currentPage + 1, slides.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = nextIndex
    }

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingSlideViewCell.identifier, for: indexPath) as! OnboardingSlideViewCell
        cell.configure(with: slides[indexPath.item])
        return cell
    }
    
    // Set cell size to match the collection view's bounds
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    // Update page control on scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
