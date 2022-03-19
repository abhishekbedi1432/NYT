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
    
    var body: some View {
        VStack {
            Text("An Error Occured")
                .font(.title)
            Text(error.localizedDescription)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40).padding()
            Button(action: retryAction, label: { Text("Retry").bold() })
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: NetworkError.invalidData, retryAction: {
            
        })
    }
}