//
//  SettingsPresenter.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation

class SettingsPresenter {
    weak var viewController: SettingsViewController?
    
    func presentAddressForm(viewModel: SettingsModels.ViewModel) {
        viewController?.displayForm(viewModel: viewModel)
    }
}
