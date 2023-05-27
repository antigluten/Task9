//
//  ViewController.swift
//  Task9
//
//  Created by va-gusev on 27.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Collection"
        view.addSubview(collectionView)
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.frame = .init(x: 0, y: 300, width: view.bounds.width, height: 400)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: String(describing: UICollectionViewCell.self))
        collectionView.contentInset = .init(top: view.layoutMargins.left, left: 16, bottom: 0, right: 16)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = .init(width: 250, height: 400)
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 12
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UICollectionViewCell.self), for: indexPath)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 16
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidth: CGFloat = 250 + 12
        let targetXContentOffset = targetContentOffset.pointee.x / cellWidth
        
        let offset = round(targetXContentOffset) * cellWidth - 20
        targetContentOffset.pointee.x = offset
    }
}
