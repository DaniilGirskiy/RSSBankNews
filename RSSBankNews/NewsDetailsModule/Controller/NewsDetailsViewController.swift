//
//  NewsDetailsViewController.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    //MARK: - Properties
    
    var model: NewsDetailsModel! // injected
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.right
        return label
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = .systemFont(ofSize: 25, weight: .black)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 20)
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.textAlignment = .natural
        return textView
    }()

    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        model.load()
        model.makeNewsViewed()
        
        configureValues()
        setUpConstraints()
        
    }
    
    //MARK: - Handlers
    
    private func configureValues() {
        textView.text = model.news.description.html2String
        dateLabel.text = model.news.date
        titleLabel.text = model.news.title
    }
    
    private func setUpConstraints() {
        
        view.addSubview(textView)
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -10).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant:  5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}
