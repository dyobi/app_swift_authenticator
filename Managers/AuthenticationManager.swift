//
//  AuthenticationManager.swift
//  Authenticator
//
//  Created by Dyobi on 4/10/22.
//

import Foundation
import LocalAuthentication // Biometrics Authentication
import SwiftUI

class AuthenticationManager: ObservableObject {
    
    private(set) var context = LAContext()
    private(set) var canEvaluatePolicy: Bool = false
    @Published private(set) var biometryType: LABiometryType = .none
    @Published private(set) var isAuthenticated: Bool = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert: Bool = false
    
    init() {
        getBiometryType()
    }
    
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let reason: String = "Log into your account"
            
            do {
                let success: Bool = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("isAuthenticated", self.isAuthenticated)
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none
                }
            }
        }
    }
    
    func authenticateWithCredentials(username: String, password: String) {
        if username.lowercased() == "jacob" && password == "123123" {
            isAuthenticated = true
        } else {
            errorDescription = "Wrong credentials"
            showAlert = true
        }
    }
    
    func logout() {
        isAuthenticated = false
    }
    
}
