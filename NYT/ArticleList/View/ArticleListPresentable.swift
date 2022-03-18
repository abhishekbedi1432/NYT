//
//  ArticlePresentable.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//
import Foundation

protocol ArticlePresentable {
    var imageUrl: URL? { get }
    var headline: String { get }
    var date: String { get }
    var author: String { get }
    var content: String { get }
}

protocol ArticleListPresentable: ArticlePresentable {
    var date: String { get }
}


protocol ArticleDetailPresentable: ArticlePresentable {}
