//
//  SettingsModels.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation

enum SettingsModels {
    struct ViewModel {
        let defaultText: String?
        let onTextChange: (String?) -> Void
    }
}
