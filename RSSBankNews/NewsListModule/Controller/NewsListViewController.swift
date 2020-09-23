//
//  NewsListViewController.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
    
    // MARK: - Properties
    
    var router: Router! // injected
    var model: NewsListModel! // injected
    
    var tableView = UITableView()
    
    private var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureNavigationUI()
        configureTableView()
        
        model.load()
    }
    
    // MARK: - Handlers
    private func configureNavigationUI() {
        title = "RSS News"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectButtonPressed))
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 100
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
        tableView.pin(to: view)
        tableView.addSubview(refreshControl)
    }
    
    @objc func selectButtonPressed() {
        configureSelectingNewsAlert()
    }
    private func configureSelectingNewsAlert() {
        let alert = UIAlertController(title: "Select News Source",
                                      message: "Please enter news source",
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "enter url"
        }
        
        let addButton = UIAlertAction(title: "Add news", style: .default) { (_) in
            
            let input = alert.textFields![0].text ?? ""
            self.model.prevUrlString = self.model.urlString
            self.model.urlString = input
            self.model.load()
  
        }
        let cancelButton = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func refresh() {
        model.load()
    }

}

// MARK: - Extensions

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId) as! NewsCell
        let item = model.newsItems[indexPath.row]
        cell.set(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsIndex = indexPath.row
        
        router.show(in: self, index: newsIndex)
    }
    
}

extension NewsListViewController: NewsListModelOutput {
    func createAlertAboutError() {
        let alert = UIAlertController(title: "Error",
                                      message: "There is no data on the entered url",
                                      preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel",
                                         style: .destructive,
                                         handler: nil)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func updateViewFromModel() {
        tableView.reloadData()
        refreshControl.endRefreshing()
        print("Update NewsList view from model")
    }
}
