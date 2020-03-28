//
//  UIViewController+Utils.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func showAlert(title: String?, message: String? = nil, accept: String = "Ok") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: accept, style: .default, handler: nil)
        alert.addAction(acceptAction)
        self.present(alert, animated: true, completion: nil)
    }
}
