//
//  ArticlePeriodModel.swift
//  NYT
//
//  Created by kbedi on 20/03/2022.
//

import Foundation

protocol ArticlePeriodOptionSortable {
    func articleOptions() -> [ArticlePeriodModel]
}

struct ArticlePeriodViewModel {
    var modal: [ArticlePeriodOption] = ArticlePeriodOption.allCases.sorted(by: {$0.rawValue < $1.rawValue })
    
    func sortOptions() -> [ArticlePeriodModel] {
        var sortedList = [ArticlePeriodModel]()
        for (index, model) in self.modal.enumerated() {
            sortedList.append(ArticlePeriodModel(id: index, title: model.value, type: model))
        }
        return sortedList
    }
}

