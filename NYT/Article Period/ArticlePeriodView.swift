
import SwiftUI

struct ArticlePeriodView<ViewModel>: View where ViewModel: ArticleListViewModel {
    
    @Environment (\.presentationMode) var presentationMode
    @Binding var selectedPeriodRange: ArticlePeriodOption
    @Binding var showModal: Bool
    @ObservedObject private(set) var viewModel: ViewModel
    
    var model = ArticlePeriodViewModel().sortOptions()
    
    var body: some View {
        List(model, id: \.id){ model in
            ZStack{
                Button("") {
                    self.showModal = false
                    self.selectedPeriodRange = model.type
                    viewModel.timePeriod = selectedPeriodRange.rawValue
                    //                    viewModel.fetchArticles(timePeriod: selectedPeriodRange.rawValue)
                }
                ArticlePeriodRow(model: model)
            }
        }
        .navigationTitle(LocalizedStringKey("select_time_period"))
        .navigationBarItems(trailing:
                                Button(LocalizedStringKey("done")) {
            self.presentationMode.wrappedValue.dismiss()
        })
        .listStyle(PlainListStyle())
    }
}
