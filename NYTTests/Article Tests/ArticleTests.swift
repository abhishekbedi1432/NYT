//
//  ArticleTests.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest
@testable import NYT

class ArticleTests: XCTestCase {

    private let stubbedFileName = "nyt_popular_response"
    private let incorrectDateFormatFile = "nyt_article_with_incorrect_published_dateformat"
    
    
    func test_article_with_not_nil_values() throws {
        
        //Given
        let expectedAuthor = "By Henry Fountain"
        let expectedHeadline = "At the Bottom of an Icy Sea"
        let expectedContent = "Explorers and researchers"
        
        let expectedImageLastPath = "09cli-shackleton-handout2-thumbStandard.jpg"
        let expectedBannerImageLastPath = "09cli-shackleton-handout2-mediumThreeByTwo440.jpg"
        let expectedDate = "Mar 17, 2022"
        let expectedFormattedDate = "3/17/2022"

        // When
        let article = try XCTUnwrap(getDummyArticleWithNotNilValues())
        
        // Then
        XCTAssertEqual(article.author, expectedAuthor)
        XCTAssertEqual(article.headline, expectedHeadline)
        XCTAssertEqual(article.content, expectedContent)
        XCTAssertEqual(article.imageUrl?.lastPathComponent, expectedBannerImageLastPath)
        XCTAssertEqual(article.thumbnailUrl?.lastPathComponent, expectedImageLastPath)
        XCTAssertEqual(article.formattedDate, expectedDate)
        
        let shortDate = try XCTUnwrap(article.date?.formatted())
        
        XCTAssertTrue(shortDate.contains(expectedFormattedDate))
        
    }
    
    func test_article_with_empty_values() throws {
        
        //Given
        let emptyString = ""
        
        //When
        let article = try XCTUnwrap(getDummyArticleWithNilValues())
        
        // Then
        XCTAssertEqual(article.author, emptyString)
        XCTAssertEqual(article.headline, emptyString)
        XCTAssertEqual(article.content, emptyString)
        XCTAssertNil(article.imageUrl?.lastPathComponent)
        XCTAssertNil(article.thumbnailUrl?.lastPathComponent)
        XCTAssertEqual(article.formattedDate, emptyString)
    }
    
    func test_articles_sorting_success() throws {
        
        // Given
        let articles = dummyArticles
        let firstArticleAuthor = "By Henry Fountain"
        let secondArticleAuthor = "By Natasha"
        
        // When
        let sortedArticles = articles.sortedByDate
        
        // Then
        XCTAssertEqual(articles.first?.author, firstArticleAuthor)
        XCTAssertEqual(articles.last?.author, secondArticleAuthor)        
        XCTAssertEqual(sortedArticles.first?.author, secondArticleAuthor)
        XCTAssertEqual(sortedArticles.last?.author, firstArticleAuthor)
        
    }
    
    func test_articles_sorting_failure() throws {
        
        // Given
        let articles = [getDummyArticleWithNotNilValues(), getDummyArticleWithNilValues()]
        let firstArticleAuthor = "By Henry Fountain"
        let secondArticleAuthor = ""
        
        // When
        let sortedArticles = articles.sortedByDate
        
        // Then
        XCTAssertEqual(articles.first?.author, firstArticleAuthor)
        XCTAssertEqual(articles.last?.author, secondArticleAuthor)
        XCTAssertEqual(sortedArticles.first?.author, firstArticleAuthor)
        XCTAssertEqual(sortedArticles.last?.author, secondArticleAuthor)
        
    }

    func test_article_with_incorrect_published_date() throws {
        
        //Given
        let emptyString = ""
        
        //When
        let article = articleWithIncorrectDateFormat
        
        //Then
        XCTAssertEqual(article?.formattedDate, emptyString)
    }

        
}


//MARK: - Private Functions
private extension ArticleTests {
    
    func getDummyArticleWithNotNilValues() -> Article {
        
        let mediaMetaDatum: [MediaMetadatum] = [
            MediaMetadatum(url: "https://static01.nyt.com/images/2022/03/09/world/09cli-shackleton-handout2/09cli-shackleton-handout2-thumbStandard.jpg", format: "Standard Thumbnail"),
            MediaMetadatum(url: "https://static01.nyt.com/images/2022/03/09/world/09cli-shackleton-handout2/09cli-shackleton-handout2-mediumThreeByTwo440.jpg", format: "mediumThreeByTwo440")
        ]
        
        let media: [Media] = [Media(mediaMetadata: mediaMetaDatum)]
        
        return Article(id: 1,
                       publishedDate: "2022-03-17",
                       byline: "By Henry Fountain",
                       title: "At the Bottom of an Icy Sea",
                       abstract: "Explorers and researchers",
                       media: media)
        
    }
    
    func getDummyArticleWithNilValues() -> Article {
        Article(id: 1,
                publishedDate: nil,
                byline: nil,
                title: nil,
                abstract: nil,
                media: nil)
    }
    
    var dummyArticles: [Article] {
        guard let response = JsonUtility.load(fromJsonFile: stubbedFileName, type: ArticleListResponse.self) else {
            XCTFail("Not able to load Response from Plist File")
            return []
        }        
         return response.articles ?? []
    }
    
    var articleWithIncorrectDateFormat: Article? {
        
        guard let response = JsonUtility.load(fromJsonFile: incorrectDateFormatFile, type: ArticleListResponse.self) else {
            XCTFail("Not able to load Response from Plist File")
            return nil
        }
        return response.articles?.first

    }
}




