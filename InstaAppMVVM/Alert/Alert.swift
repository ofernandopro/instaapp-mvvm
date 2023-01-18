//
//  Alert.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 18/01/23.
//

import UIKit

class Alert {

    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
    
}
