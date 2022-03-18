//
//  TheGameRouter.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation
import UIKit

class TheGameRouter {
    weak var viewController: TheGameViewController?
    
    func routeToWallet() {
        let navigation = UINavigationController(rootViewController: WalletViewController())
        let activity = CustomActivityViewController(controller: navigation, onDismiss: nil)
        viewController?.present(activity, animated: true, completion: nil)
    }
    
    func routeToSettings() {
        let navigation = UINavigationController(rootViewController: SettingsViewController())
        let activity = CustomActivityViewController(controller: navigation, onDismiss: nil)
        viewController?.present(activity, animated: true, completion: nil)
    }
}
