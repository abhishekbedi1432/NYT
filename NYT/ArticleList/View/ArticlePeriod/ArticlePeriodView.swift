

import SwiftUI

struct ArticlePeriodView<ViewModel>: View where ViewModel: ArticleListContract {
    @Environment (\.presentationMode) var presentationMode
    @Binding var selectedPeriodRange: ArticlePeriodOption
    @Binding var showModal: Bool
    @ObservedObject private(set) var viewModel: ViewModel

    var model = ArticlePeriodViewModel().sortOptions()

    var body: some View{
        List(model, id: \.id){ model in
            ZStack{
                Button("") {
                    self.showModal = false
                    self.selectedPeriodRange = model.type
                    viewModel.fetchArticles(withRange: selectedPeriodRange.rawValue)
                }
                ArticlePeriodRow(model: model)
            }
        }
        .navigationTitle("Select Time Period")
        .navigationBarItems(trailing:
                                Button("Done") {
                                    self.presentationMode.wrappedValue.dismiss()
                                })
        .listStyle(PlainListStyle())
    }
}
