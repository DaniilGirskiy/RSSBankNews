//
//  NewsDetailsViewControllerAssembly.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class NewsDetailsViewControllerAssembly {
    private lazy var modelAssembly = NewsDetailsModelAssembly()
    
    func newsDetailsVC(index: Int) -> UIViewController {
        
        let viewController = NewsDetailsViewController()
        viewController.model = modelAssembly.model(with: index)
        
        return viewController
    }
    
    
}
