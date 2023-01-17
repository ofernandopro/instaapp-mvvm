//
//  LoginVC.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 17/01/23.
//

import UIKit

class LoginVC: UIViewController {

    private var loginScreen: LoginScreen?
    private var viewModel: LoginViewModel = LoginViewModel()
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
    }

}

extension LoginVC: LoginScreenProtocol {
    
    func tappedLoginButton() {
//        let vc: HomeVC = HomeVC()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
        
        viewModel.registerUser(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
    
}


extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
}
