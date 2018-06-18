//
//  ServicesCellDataSource.swift
//  Copla
//
//  Created by Anton Yereshchenko on 6/17/18.
//  Copyright © 2018 Anton Yereshchenko. All rights reserved.
//

import UIKit

protocol ServicesCellDataSourceDelegate {
    func didSelect(item: Service)
}

class ServicesCellDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView?
    private let verticalPadding: CGFloat = 8.0
    private let cellId = "cell"
    var items: [Service] = [Service]()
    
    var servicesDelegate: ServicesCellDataSourceDelegate?
    
    init(with collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(ServiceCollectionViewCell.nib(), forCellWithReuseIdentifier: self.cellId)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! ServiceCollectionViewCell
        cell.isAdvertisement = false
        cell.initCell(service: self.items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        self.servicesDelegate?.didSelect(item: item)
    }
    
    func isAddingCell(in point: CGPoint) -> Bool {
        if let indexPath = self.collectionView?.indexPathForItem(at: point) {
            if indexPath.row == self.items.count {
                return true
            }
        }
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
}
