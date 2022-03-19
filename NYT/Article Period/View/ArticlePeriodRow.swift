//
//  ArticlePeriodModel.swift
//  NYT
//
//  Created by kbedi on 20/03/2022.
//

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
