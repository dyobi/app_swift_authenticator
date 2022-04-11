//
//  Title.swift
//  Authenticator
//
//  Created by Dyobi on 4/10/22.
//

import SwiftUI

struct Title: View {
    
    var body: some View {
        Text("Authenticator")
            .bold()
            .font(.title)
            .foregroundColor(.white)
    } // body
    
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
