//
//  ViewController.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import UIKit

class TheGameViewController: UIViewController {
    
    private let walletItem = UIBarButtonItem()
    private let settingsItem = UIBarButtonItem()
    
    private let router = TheGameRouter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureTitle()
        configureBackground()
        configureWalletItem()
        configureSettingsItem()
    }
    
    // MARK: Setup
    
    private func setup() {
        router.viewController = self
    }
    
    // MARK: Configure
    
    private func configureTitle() {
        title = "THE NATURE GAME"
    }
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureWalletItem() {
        walletItem.image = UIImage(systemName: "folder.fill")
        walletItem.target = self
        walletItem.action = #selector(onWalletItem)
        navigationItem.rightBarButtonItem = walletItem
    }
    
    private func configureSettingsItem() {
        settingsItem.image = UIImage(systemName: "gear")
        settingsItem.target = self
        settingsItem.action = #selector(onSettingsItem)
        navigationItem.leftBarButtonItem = settingsItem
    }
    
    // MARK: User Action
    
    @objc func onWalletItem() {
        router.routeToWallet()
    }
    
    @objc func onSettingsItem() {
        router.routeToSettings()
    }
}

