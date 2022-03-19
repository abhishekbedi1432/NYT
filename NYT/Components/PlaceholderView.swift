//
//  PlaceholderView.swift
//  NYT
//
//  Created by kbedi on 19/03/2022.
//

import SwiftUI

// MARK: Placeholder View

struct PlaceholderView: View {
    var body: some View {
        List {
            ForEach (0..<10) { _ in
                HStack {
                    Image(systemName: "star.fill")
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam")
                }
                .redacted(reason: .placeholder)
            }
        }
    }
}



struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
