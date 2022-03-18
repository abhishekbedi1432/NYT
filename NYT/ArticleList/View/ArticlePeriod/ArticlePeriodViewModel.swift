

import UIKit
import Foundation

enum ArticlePeriodOption: Int, CaseIterable {
    case daily =  1
    case weekly = 7
    case monthly = 30
    
    var value: String {
        switch self {
            case .daily:
                return "Today"
            case .weekly:
                return "Weekly"
            case .monthly:
                return "Monthly"
        }
    }
}

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

struct ArticlePeriodModel {
    var id: Int
    var title: String
    var type: ArticlePeriodOption
}
