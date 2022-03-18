

import SwiftUI

struct ArticlePeriodView: View {
    @Environment (\.presentationMode) var presentationMode
    @Binding var selectedPeriodRange: ArticlePeriodOption
    @Binding var showModal: Bool

    var model = ArticlePeriodViewModel().sortOptions()

    var body: some View{
        List(model, id: \.id){ model in
            ZStack{
                Button("") {
                    self.showModal = false
                    self.selectedPeriodRange = model.type
                }
                ArticlePeriodRow(model: model)
            }
        }
        .navigationTitle("Sort By")
        .navigationBarItems(trailing:
                                Button("Done") {
                                    self.presentationMode.wrappedValue.dismiss()
                                })
        .listStyle(PlainListStyle())
    }
}
