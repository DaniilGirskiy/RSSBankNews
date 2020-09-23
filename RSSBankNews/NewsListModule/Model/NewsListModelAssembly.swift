//
//  NewsListModelAssembly.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class NewsListModelAssembly {
    lazy var storageAssembly = StorageAssembly()
    lazy var networkAssembly = NetworkServiceAssembly()
    
    var model: NewsListModel {
        let model = NewsListModelImpl()
        
        model.storage = storageAssembly.storage()
        model.network = networkAssembly.network
        
        model.storage.output = model
        
        return model
    }
    
}
