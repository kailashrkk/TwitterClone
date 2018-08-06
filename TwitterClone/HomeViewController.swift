//
//  File.swift
//  TwitterClone
//
//  Created by Kailash on 8/5/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit

class customCell: UICollectionViewCell{
    
    var textView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false;
        text.text = "TEST"
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
        textView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let collectionCellIdentifier = "CellID"
    let headerIdentifier = "HeaderID"
    let footerIdentifier = "FooterID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .blue;
        collectionView?.register(customCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier);
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier);
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath)
            cell.backgroundColor = UIColor.darkGray
            return cell
        }else{
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier, for: indexPath)
            cell.backgroundColor = UIColor.white
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.bounds.height, height: 150)
    }
}
