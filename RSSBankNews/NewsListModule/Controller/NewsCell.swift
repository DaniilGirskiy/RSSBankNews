//
//  NewsCell.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let reuseId = "NewsCell"

    var viewedNewsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .black))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        return imageView
    }()
    var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    var newsDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(newsTitleLabel)
        addSubview(newsDateLabel)
        addSubview(viewedNewsImageView)
        setUpConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(item: NewsListItem) {
        newsTitleLabel.text = item.title
        newsDateLabel.text = item.date
        viewedNewsImageView.isHidden = item.viewed
    }
    
    private func setUpConstrains() {
        
        viewedNewsImageView.translatesAutoresizingMaskIntoConstraints = false
        viewedNewsImageView.topAnchor.constraint(equalTo: topAnchor,constant: 8).isActive = true
        viewedNewsImageView.trailingAnchor.constraint(equalTo: newsDateLabel.leadingAnchor, constant: -2).isActive = true
        viewedNewsImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        viewedNewsImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        newsDateLabel.translatesAutoresizingMaskIntoConstraints = false
        newsDateLabel.topAnchor.constraint(equalTo: topAnchor,constant: 8).isActive = true
        newsDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        newsDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        newsDateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.topAnchor.constraint(equalTo: newsDateLabel.bottomAnchor, constant: 5).isActive = true
        newsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        newsTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12).isActive = true
    }
    
}
