//
//  AsyncImageView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct AsyncImageView: View {
    
    // MARK: Properties
    var imageUrl: URL?
    
    var body: some View {
        AsyncImage(url: imageUrl) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
