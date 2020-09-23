//
//  NewsDetailsModel.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol NewsDetailsModel {
    func load()
    func makeNewsViewed()
    
    var news: NewsDetailsItem! { get set }
}

class NewsDetailsModelImpl: NewsDetailsModel {
    var storage: Storage! //injected
    var index: Int! // injected
    
    var news: NewsDetailsItem!
    
    func load() {
        news = NewsDetailsItem(title: storage.storageItems[index].title,
                               date: storage.storageItems[index].date,
                               description: storage.storageItems[index].description)
    }
    
    func makeNewsViewed() {
        storage.changeStorageItemViewedState(at: index)
    }
    
}
