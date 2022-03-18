//
//  HabituesTableViewCell.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let numberLabel = UILabel()
    private let iconView = UIImageView()
    
    class var cellIdentifier: String {
        return "ItemTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureIconView()
        configureNameLabel()
        configureNumberLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    
    private func configureIconView() {
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func configureNameLabel() {
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureNumberLabel() {
        numberLabel.numberOfLines = 0
        numberLabel.textAlignment = .right
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(numberLabel)
        numberLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 8).isActive = true
        numberLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        numberLabel.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 0).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func set(item: Item) {
        nameLabel.text = item.name
        numberLabel.text = "\(item.number)"
        iconView.image = UIImage(systemName: item.image)
    }
}
