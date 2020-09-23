//
//  NewsListViewControllerAssembly.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class NewsListViewControllerAssembly {
    private lazy var modelAssembly = NewsListModelAssembly()
    private lazy var routerAssembly = RouterAssembly()
    
    var viewController: UIViewController {
        let rootVC = NewsListViewController()
        rootVC.router = routerAssembly.router
        rootVC.model = modelAssembly.model
        rootVC.model.output = rootVC
        
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
}
