
import SwiftUI

struct ArticlePeriodRow: View {
    let model: ArticlePeriodModel
    var body: some View{
        VStack{
            HStack{
                Text(model.title)
                Spacer()
            }
        }.padding(.top)
            .padding(.bottom)
    }
}
