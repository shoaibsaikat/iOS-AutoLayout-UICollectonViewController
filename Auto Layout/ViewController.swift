//
//  ViewController.swift
//  Auto Layout
//
//  Created by Mina Shoaib Rahman on 12/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    let topContainerView: UIView = {
        let container = UIView()
        // container.backgroundColor = .red
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let imageView: UIImageView = {
        let image = UIImage(imageLiteralResourceName: "king")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // transform will take full image frame size, so it will make a big frame even though we've scaled it down. so to scale it down we should use heigh and width constraint
        // imageView.transform = CGAffineTransform.identity.scaledBy(x: 0.2, y: 0.2)
        return imageView
    }()
    
    let titleView: UITextView = {
        let titleFont = UIFont.boldSystemFont(ofSize: 20)
        let detailFont = UIFont.systemFont(ofSize: 16)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: titleFont,
        ]
        let detailAttributes: [NSAttributedString.Key: Any] = [
            .font: detailFont,
            .foregroundColor: UIColor.gray
        ]
        
        var attributedText = NSMutableAttributedString(string: "Join us today for fun and games!\n\n\n", attributes: titleAttributes)
        attributedText.append(NSAttributedString(string: "Are you ready for loads and loads of fun? Don't wait any longer! Hope to see you in our stores soon.", attributes: detailAttributes))
        
        let textView = UITextView()
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        layTopView()
        layBottomView()
    }
    
    func layTopView() {
        // view must be added as a subview before making any layiout constraint adjustment, otherwise we'll get runtime exception
        view.addSubview(topContainerView)
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

        topContainerView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func layBottomView() {
        view.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        // trailing or right constaint has to be negative
        titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46).isActive = true
        titleView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    

}

