//
//  SwipeViewController.swift
//  Auto Layout
//
//  Created by Mina Shoaib Rahman on 2/7/24.
//

import UIKit

private let reuseIdentifier = "Cell"

class SwipeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var pages = [
        Page(imageURL: "cardback", headerText: "Check our designed cards!", bodyText: "You'll find lots of desiged cards, that you won't find anywhere else."),
        Page(imageURL: "king", headerText: "Join us today for fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! Hope to see you in our stores soon."),
        Page(imageURL: "queen", headerText: "Join our Card Game now!", bodyText: "Our game has lots of different cards for your choosing. Join us now!"),
        Page(imageURL: "jack", headerText: "Want to see cards in actiion!", bodyText: "We'll provide lots of custom games for your liking. We're waiting for you."),
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PageViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageViewCell
    
        // Configure the cell
        cell.setPage(page: pages[indexPath.item])
        print("\(indexPath.item)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
