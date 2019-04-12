//
//  ViewController.swift
//  ReusableViewDemo
//
//  Created by Gillian Reynolds-Titko on 4/6/19.
//  Copyright © 2019 GRey-T-Programs. All rights reserved.
//

//Use this application to determine how to pass information to a supplementary view/header in a collection view
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColourCell", for: indexPath) as! ColourCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerViewCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ColourHeader", for: indexPath) as! ColourCollectionReusableView
        headerViewCell.headerScene.backgroundColor = UIColor.green
        headerViewCell.createBlenderSphere()
//        headerViewCell.swapInNewPosts(colors: [UIColor.red, UIColor.green, UIColor.purple, UIColor.blue])
        headerViewCell.swapInNew(colors: [UIColor.red, UIColor.green, UIColor.purple, UIColor.blue])
        return headerViewCell
    }

}


