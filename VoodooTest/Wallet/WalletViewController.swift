//
//  WalletViewController.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import UIKit

class WalletViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    private let interactor = WalletInteractor()
    
    var viewModel: WalletModels.ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureTitle()
        configureBackground()
        configureTableView()
        
        interactor.loadItems()
    }
    
    // MARK: Setup
    
    private func setup() {
        interactor.presenter.viewController = self
    }
    
    // MARK: Configure
    
    private func configureTitle() {
        title = "Wallet"
    }
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    func displayItems(viewModel: WalletModels.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath) as? ItemTableViewCell {
            if let item = viewModel?.items[indexPath.row] {
                cell.set(item: item)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
