//
//  PageViewCell.swift
//  Auto Layout
//
//  Created by Mina Shoaib Rahman on 3/7/24.
//

import UIKit

class PageViewCell: UICollectionViewCell {
    
    private var page: Page?
    
    private let topContainerView: UIView = {
        let container = UIView()
        // container.backgroundColor = .red
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy private var imageView: UIImageView = {
        let image = UIImage(imageLiteralResourceName: self.page!.imageURL)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // transform will take full image frame size, so it will make a big frame even though we've scaled it down. so to scale it down we should use heigh and width constraint
        // imageView.transform = CGAffineTransform.identity.scaledBy(x: 0.2, y: 0.2)
        return imageView
    }()
    
    lazy private var textView: UITextView = {
        let titleFont = UIFont.boldSystemFont(ofSize: 20)
        let detailFont = UIFont.systemFont(ofSize: 16)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: titleFont,
        ]
        let detailAttributes: [NSAttributedString.Key: Any] = [
            .font: detailFont,
            .foregroundColor: UIColor.gray
        ]
        
        var attributedText = NSMutableAttributedString(string: self.page!.headerText, attributes: titleAttributes)
        attributedText.append(NSAttributedString(string: "\n\n\n\(self.page!.bodyText)", attributes: detailAttributes))
        
        let textView = UITextView()
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPage(page: Page) {
        self.page = page
        layTopView()
        layDetailView()
    }
    
    private func layTopView() {
        // view must be added as a subview before making any layiout constraint adjustment, otherwise we'll get runtime exception
        addSubview(topContainerView)
        topContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true

        topContainerView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func layDetailView() {
        addSubview(textView)
        textView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 46).isActive = true
        // trailing or right constaint has to be negative
        textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -46).isActive = true
        textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
