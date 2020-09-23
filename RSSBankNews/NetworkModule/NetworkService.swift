//
//  NetworkService.swift
//  RSSBankNews
//
//  Created by Danya on 21.09.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol NetworkService {
    func parseFeed(urlString: String, completionHandler: (([RSSItem]) -> Void)?)
    
}

class NetworkServiceImpl: NSObject, XMLParserDelegate, NetworkService {
    
    private var rssItems: [RSSItem] = []
    private var currentElement = ""
    private var currentTitle = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var parserCompletionHandler: (([RSSItem]) -> Void)?
    
    func parseFeed(urlString: String, completionHandler: (([RSSItem]) -> Void)?) {
        
        self.parserCompletionHandler = completionHandler
        rssItems = [] //!!!
        guard let url = URL(string: urlString) else {
            completionHandler?([])
            return }
        
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    completionHandler?([])
                    return
                }
                // parse xml data
                let parser = XMLParser(data: data)
                parser.delegate = self
                parser.parse()
            }
        }
        task.resume()
    }
    
    
    // MARK: - XML Parser Delegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title": currentTitle += string
        case "description": currentDescription += string
        case "pubDate": currentPubDate += string
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, pubdate: currentPubDate, description: currentDescription)
            self.rssItems.append(rssItem)
        } 
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
}
