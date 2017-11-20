//
//  ArticleListService.swift
//  MVVMSample
//
//  Created by Andrey Mikhaylov on 19/11/2017.
//  Copyright © 2017 Andrey Mikhaylov. All rights reserved.
//

import ReactiveSwift
import Result

protocol ArticleListService {
    func getAllArticles() -> SignalProducer<[Article], AnyError>
}

class FakeArticleInfoViewModel: ArticleListService {
    func getAllArticles() -> SignalProducer<[Article], AnyError> {
        return SignalProducer(value: generateFakeArticles()).delay(2, on: QueueScheduler.main)
    }
    
    private func generateFakeArticles() -> [Article] {
        let url = URL(string: "http://topclassiccarsforsale.com/uploads/photoalbum/1982-porsche-911-sc-primo-condition-3.jpg")!
        let firstArticle = Article(identifier: "first",
                                   title: "Article Title 2",
                                   text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                   date: Date(),
                                   iamgeURL: url)
        
        let secondArticle = Article(identifier: "first",
                                    title: "Article Title 2",
                                    text: "Fusce posuere, erat et dictum consectetur, erat magna posuere erat, sed egestas lectus tortor id urna. ",
                                    date: Date(),
                                    iamgeURL: url)
        
        return [firstArticle, secondArticle]
    }
}
