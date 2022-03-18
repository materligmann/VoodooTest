//
//  SettingsInteractor.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation

class SettingsInteractor {
    let presenter = SettingsPresenter()
    private let worker = SettingsWorker()
    
    func loadAddressForm() {
        let viewModel = worker.fetchForm(onTextChange: onTextChange(text:))
        presenter.presentAddressForm(viewModel: viewModel)
    }
    
    func onTextChange(text: String?) {
        if let text = text {
            Persistance.saveCurrentAddress(address: text)
        } else {
            Persistance.saveCurrentAddress(address: "")
        }
    }
}
