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
            Text("\(title)").font(.system(.title))
            Text("\(subTitle)").font(.system(.subheadline)).foregroundColor(.gray)
            Text("\(abstract)").font(.system(.subheadline)).foregroundColor(.gray)

        }
    }
}

struct ArticleDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailCellView(title: "Title", subTitle: "Subtitle", abstract: "Abstract")
    }
}
