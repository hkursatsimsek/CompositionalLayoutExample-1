//
//  ViewController.swift
//  CompositionalLayoutExample-1
//
//  Created by Kürşat Şimşek on 7.07.2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = createLayout2()
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//            self.collectionView.collectionViewLayout = self.createLayout1()
            self.collectionView.setCollectionViewLayout(self.createLayout1(), animated: true)
        })
    }
    
    private func createLayout1() -> UICollectionViewCompositionalLayout {
        // Items
        let itemForGroup1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        itemForGroup1.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let leftItemForGroup2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        
        let rightItemForGroup2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
//        rightItemForGroup2.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let itemForGroup3 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1)))
        itemForGroup3.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        // Groups
        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [itemForGroup1])
        
        let group2RightItems = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)), subitems: [rightItemForGroup2])
        group2RightItems.interItemSpacing = .fixed(10)
        
        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [leftItemForGroup2, group2RightItems])
//        group2.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        group2.interItemSpacing = .fixed(10)
        
        let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [itemForGroup3])
        
        let mainGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [group1, group2,group3])
        mainGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        // Section
        let section = NSCollectionLayoutSection(group: group2)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func createLayout2() -> UICollectionViewCompositionalLayout {
        // Items
        let itemForGroup1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        itemForGroup1.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let leftItemForGroup2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        
        let rightItemForGroup2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
//        rightItemForGroup2.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let itemForGroup3 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1)))
        itemForGroup3.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        // Groups
        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [itemForGroup1])
        
        let group2RightItems = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)), subitems: [rightItemForGroup2])
        group2RightItems.interItemSpacing = .fixed(10)
        
        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [leftItemForGroup2, group2RightItems])
//        group2.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        group2.interItemSpacing = .fixed(10)
        
        let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [itemForGroup3])
        
        let mainGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [group1, group2,group3])
        mainGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        // Section
        let section = NSCollectionLayoutSection(group: group3)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
}
