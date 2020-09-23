//
//  StorageAssembly.swift
//  RSSBankNews
//
//  Created by Danya on 20.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class StorageAssembly { // singleton
    private static let storage = StorageImpl()
    
    func storage() -> Storage {
        return StorageAssembly.storage
    }
    
}
