//
//  PageViewCell.swift
//  Auto Layout
//
//  Created by Mina Shoaib Rahman on 3/7/24.
//

import UIKit

class PageViewCell: UICollectionViewCell {
    
    var headerText: String = "" {
        didSet {
            drawTextView()
        }
    }
    var bodyText: String = "" {
        didSet {
            drawTextView()
        }
    }
    var image: String? {
        didSet {
            imageView.image = image != nil ? UIImage(named: image!) : UIImage(systemName: "questionmark.circle.fill")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private var imageView = UIImageView()
    private var textView = UITextView()
    
    private func drawTextView() {
        let titleFont = UIFont.boldSystemFont(ofSize: 18)
        let detailFont = UIFont.systemFont(ofSize: 16)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: titleFont,
        ]
        let detailAttributes: [NSAttributedString.Key: Any] = [
            .font: detailFont,
            .foregroundColor: UIColor.gray
        ]
        let attributedText = NSMutableAttributedString(string: "\n\n\n\(headerText)", attributes: titleAttributes)
        attributedText.append(NSAttributedString(string: "\n\n\(bodyText)", attributes: detailAttributes))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layTopView()
        layDetailView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layTopView() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        // imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func layDetailView() {
        addSubview(textView)
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 46).isActive = true
        textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -46).isActive = true
        textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}
