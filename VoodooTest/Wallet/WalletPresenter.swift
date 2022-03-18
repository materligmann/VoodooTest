//
//  WalletPresenter.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation

class WalletPresenter {
    weak var viewController: WalletViewController?
    
    func presentItems(items: [Item]) {
        viewController?.displayItems(viewModel: WalletModels.ViewModel(items: items))
    }
}
