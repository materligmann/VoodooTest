//
//  SettingsViewController.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    private let interactor = SettingsInteractor()
    
    var viewModel: SettingsModels.ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureTitle()
        configureBackground()
        configureTableView()
        
        interactor.loadAddressForm()
    }
    
    // MARK: Setup
    
    private func setup() {
        interactor.presenter.viewController = self
    }
    
    // MARK: Configure
    
    private func configureTitle() {
        title = "Settings"
    }
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    func displayForm(viewModel: SettingsModels.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingsCell()
        if let viewModel = viewModel {
            cell.set(defaultText: viewModel.defaultText, onTextChange: viewModel.onTextChange)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
