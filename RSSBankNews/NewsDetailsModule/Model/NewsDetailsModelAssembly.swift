//
//  NewsDetailsModelAssembly.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class NewsDetailsModelAssembly {
    private lazy var storageAssembly = StorageAssembly()
    
    func model(with index: Int) -> NewsDetailsModel {
        let model = NewsDetailsModelImpl()
        model.storage = storageAssembly.storage()
        model.index = index
        return model
    }
    
}
