//
//  ArticleDetailCellView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct ArticleDetailCellView: View {
    var title: String
    var subTitle: String
    var abstract: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("\(title)")
                .font(.headline)
                .lineLimit(2)
            Text("\(subTitle)")
                .font(.caption)
                .foregroundColor(.gray)
                .fontWeight(.light)
            Text("\(abstract)")
                .font(.subheadline)
        }.padding()
    }
}

struct ArticleDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailCellView(title: "Title  Title Title  Title Title  Title Title  Title", subTitle: "Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle", abstract: "Abstract Abstract Abstract")
    }
}
