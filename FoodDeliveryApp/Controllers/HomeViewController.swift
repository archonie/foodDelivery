//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 28.11.2024.
//

import UIKit

class HomeViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        return collectionView
    }()
    
    private var homeCards = [
        HomeCard(
            title: "Food Category",
            categories: [
                DishCategory(id: "id1", title: "Africa Dish", image: "https://picsum.photos/100/200"),
                DishCategory(id: "id2", title: "Africa Dish 2", image: "https://picsum.photos/100/200"),
                DishCategory(id: "id3", title: "Africa Dish 3", image: "https://picsum.photos/100/200"),
                DishCategory(id: "id4", title: "Africa Dish 4", image: "https://picsum.photos/100/200"),
                DishCategory(id: "id5", title: "Africa Dish 5", image: "https://picsum.photos/100/200"),
            ]
        ),
        HomeCard(title: "Popular Dishes", categories: [DishCategory(id: "2", title: "Main", image: "")]),
        HomeCard(title: "Chef's Specials", categories: [DishCategory(id: "3", title: "Soup", image: "")]),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        title = "Yummie"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"), style: .done, target: self, action: #selector(didTapCartButton))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "tintColor")
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height-view.safeAreaInsets.top)
    }
    
    @objc private func didTapCartButton() {
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        cell.configure(with: homeCards[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return indexPath.row == 1 ? CGSize(width: view.width, height: (view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)/2) :  CGSize(width: view.width, height: (view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

}
