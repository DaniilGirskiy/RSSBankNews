//
//  StringProtocol+Ext.swift
//  RSSBankNews
//
//  Created by Danya on 22.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
