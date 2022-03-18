//
//  SettingsWorker.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation

class SettingsWorker {
    func fetchForm(onTextChange: @escaping (String?) -> Void) -> SettingsModels.ViewModel {
        return SettingsModels.ViewModel(defaultText: Persistance.getCurrentAddress(),
                                        onTextChange: onTextChange)
    }
}
