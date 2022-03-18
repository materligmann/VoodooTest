//
//  SettingsCell.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import UIKit

class SettingsCell: UITableViewCell {

    private let textField = UITextField()
    private var onTextChange: ((String?) -> Void)?
    
    class var cellIdentifier: String {
        return "SettingsCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        textField.addTarget(self, action: #selector(onTextFieldChange), for: .editingChanged)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
    }
    
    func set(defaultText: String?, onTextChange: @escaping (String?) -> Void) {
        self.onTextChange = onTextChange
        textField.text = defaultText
    }
    
    // MARK: User Action
    
    @objc func onTextFieldChange() {
        onTextChange?(textField.text)
    }
}
