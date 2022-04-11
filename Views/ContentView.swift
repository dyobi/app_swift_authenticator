//
//  ContentView.swift
//  Authenticator
//
//  Created by Dyobi on 4/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if authenticationManager.isAuthenticated {
                    
                    VStack (spacing: 40) {
                        Title()
                        
                        Text("Welcome in! You're now authenticated")
                            .foregroundColor(.white)
                        
                        PrimaryButton(showImage: false, text: "Logout")
                            .onTapGesture {
                                authenticationManager.logout()
                            }
                    } // VStack
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                } else {
                    
                    LoginView()
                        .environmentObject(authenticationManager)
                    
                }
            } // VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $authenticationManager.showAlert) {
                Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error trying to login with credentials, please try again"), dismissButton: .default(Text("Ok")))
            }
            
        } // NavigationView
        
    } // body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
