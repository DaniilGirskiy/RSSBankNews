//
//  DateFormatter+Ext.swift
//  RSSBankNews
//
//  Created by Danya on 22.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func format(str: String) -> String {
        
//        let dateFormatter: DateFormatter = {
//            let date = DateFormatter()
//            date.locale = Locale(identifier: "ru_RU")
//            date.dateFormat = "d MMM 'в' HH:mm"
//            return date
//        }()
//
//        let dateFormatter1 = DateFormatter()
//        dateFormatter1.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
//        let date = dateFormatter1.date(from: str)
//
//        return dateFormatter.string(from: date!)
        
        locale = Locale(identifier: "ru_RU")
        dateFormat = "d MMM 'в' HH:mm"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let date = dateFormatter.date(from: str)
        
        return self.string(from: date!)
    }
    
}
