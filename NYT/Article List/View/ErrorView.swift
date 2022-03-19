//
//  ErrorView.swift
//  NYT
//
//  Created by kbedi on 19/03/2022.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    let retryAction: () -> Void
    
    // MARK: Constants
    private struct Constants {
        static let bottomPadding: CGFloat = 40
    }
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("an_error_occured"))
                .font(.title)
            Text(error.localizedDescription)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.bottom, Constants.bottomPadding).padding()
            Button(action: retryAction, label: { Text(LocalizedStringKey("retry")).bold() })
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: NetworkError.invalidData, retryAction: {
            print("Retry!")
        })
    }
}
