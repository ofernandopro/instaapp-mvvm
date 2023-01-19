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
        viewModel.delegate(delegate: self)
        
        loginScreen?.emailTextField.text = "ola@gmail.com"
        loginScreen?.passwordTextField.text = "a12345"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

}

extension LoginVC: LoginScreenProtocol {
    
    func tappedRegisterButton() {
        let vc = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
        //fatalError()
    }
    
    func tappedLoginButton() {
        viewModel.login(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
    
}

extension LoginVC: LoginViewModelProtocol {
    
    func successLogin() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorLogin(errorMessage: String) {
        print(#function)
        Alert(controller: self).showAlertInformation(title: "Erro", message: errorMessage)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
        } else {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
