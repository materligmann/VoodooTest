//
//  WalletInteractor.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation

class WalletInteractor {
    
    private let worker = WalletWorker()
    let presenter = WalletPresenter()
    
    func loadItems() {
        worker.fetchItem { items in
            self.presenter.presentItems(items: items)
        }
    }
}
