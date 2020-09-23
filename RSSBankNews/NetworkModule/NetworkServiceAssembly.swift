//
//  NetworkServiceAssembly.swift
//  RSSBankNews
//
//  Created by Danya on 21.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class NetworkServiceAssembly {
    
    var network: NetworkService {
        return NetworkServiceImpl()
    }
    
}
