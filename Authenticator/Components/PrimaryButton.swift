//
//  PrimaryButton.swift
//  Authenticator
//
//  Created by Dyobi on 4/11/22.
//

import SwiftUI

struct PrimaryButton: View {
    
    var image: String?
    var showImage: Bool = true
    var text: String
    
    var body: some View {
        
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
            }
            
            Text(text)
        } // HStack
        .padding()
        .padding(.horizontal)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 10)
        
    } // body
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(image: "faceid", text: "Login with FaceID")
    }
}
