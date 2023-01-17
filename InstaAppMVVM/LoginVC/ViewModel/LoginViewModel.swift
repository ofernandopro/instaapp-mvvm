//
//  LoginViewModel.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 17/01/23.
//

import UIKit
import Firebase

class LoginViewModel {

    private var auth = Auth.auth()
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso Login")
            } else {
                print("Erro Login: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso Cadastro")
            } else {
                print("Erro Cadastro: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
}
