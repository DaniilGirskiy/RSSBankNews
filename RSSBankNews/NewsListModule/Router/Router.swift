//
//  Router.swift
//  RSSBankNews
//
//  Created by Danya on 21.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class RouterAssembly {
    var router: Router {
        let router = RouterImpl()
        return router
    }
}

protocol Router {
    func show(in vc: UIViewController, index: Int)
}

class RouterImpl: Router {
    let newsDetailsViewControllerAssembly = NewsDetailsViewControllerAssembly()
    
    func show(in vc: UIViewController, index: Int) {
        vc.navigationController?.pushViewController(newsDetailsViewControllerAssembly.newsDetailsVC(index: index), animated: true)
    }
}
