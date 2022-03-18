//
//  ArticlePresentable.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//
import Foundation

protocol ArticlePresentable {
    var headline: String { get }
    var date: String { get }
    var author: String { get }
    var content: String { get }
    var thumbnailUrl: URL? { get }
    var imageUrl: URL? { get }
}
