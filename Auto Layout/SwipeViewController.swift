//
//  SwipeViewController.swift
//  Auto Layout
//
//  Created by Mina Shoaib Rahman on 2/7/24.
//

import UIKit

private let reuseIdentifier = "Cell"

class SwipeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var pages: [Page] = [
        Page(image: "cardback", headerText: "Check our designed cards!", bodyText: "You'll find lots of desiged cards, that you won't find anywhere else."),
        Page(image: "king", headerText: "Join us today for fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! Hope to see you in our stores soon."),
        Page(image: "queen", headerText: "Try our Card Game now!", bodyText: "Our game has lots of different cards for your choosing. Join us now!"),
        Page(image: "jack", headerText: "Want to see cards in actiion!", bodyText: "We'll provide lots of custom games for your liking. We're waiting for you."),
    ]
    
    private let prevButton: UIButton = {
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        // button.backgroundColor = .red
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        // button.backgroundColor = .green
        return button
    }()
    
    lazy private var pageIndicator: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = pages.count
        control.currentPageIndicatorTintColor = .systemPink
        control.pageIndicatorTintColor = .gray
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PageViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
        
        layBottomView()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageViewCell
        // Configure the cell
        cell.headerText = pages[indexPath.item].headerText
        cell.bodyText = pages[indexPath.item].bodyText
        cell.image = pages[indexPath.item].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    // MARK: Etc.
    
    func layBottomView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(prevButton)
        stackView.addArrangedSubview(pageIndicator)
        stackView.addArrangedSubview(nextButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // stackView.backgroundColor = .red
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}
