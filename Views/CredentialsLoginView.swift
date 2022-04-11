//
//  CredentialsLoginView.swift
//  Authenticator
//
//  Created by Dyobi on 4/10/22.
//

import SwiftUI

struct CredentialsLoginView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack (spacing: 40) {
            Title()
            
            TextField("Username", text: $username)
            
            SecureField("Password", text: $password)
            
            PrimaryButton(showImage: false, text: "Login")
                .onTapGesture {
                    authenticationManager.authenticateWithCredentials(username: username, password: password)
                }
        } // VStack
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        
    } // body
    
}

struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticationManager())
    }
}
