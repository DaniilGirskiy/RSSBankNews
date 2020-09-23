//
//  Storage.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol Storage {
    var output: StorageOutput? { get set }
    func setStorageItems(storageItems: [StorageItem])
    
    func changeStorageItemViewedState(at index: Int)
    
    var storageItems: [StorageItem] { get set }
}

protocol StorageOutput {
    func collectionChanged(newValue: [StorageItem])
}

class StorageImpl: Storage {
    var output: StorageOutput?
    
    var storageItems: [StorageItem] = []
    
    func setStorageItems(storageItems: [StorageItem]) {
        self.storageItems = storageItems
        output?.collectionChanged(newValue: storageItems)
    }
    
    func changeStorageItemViewedState(at index: Int) {
        self.storageItems[index] = StorageItem(title: storageItems[index].title,
                                               date: storageItems[index].date,
                                               description: storageItems[index].description,
                                               viewed: true)
        output?.collectionChanged(newValue: storageItems)
    }
    
}
