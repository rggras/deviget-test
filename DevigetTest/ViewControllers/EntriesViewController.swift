//
//  EntriesViewController.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

import UIKit

class EntriesViewController: UITableViewController {

    let viewModel = EntriesViewModel()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getEntries()
    }

    // MARK: Private Methos
    
    private func setupUI() {
        title = "Reddit Posts"
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryViewCell") as! EntryViewCell
        cell.setup(for: viewModel.entries[indexPath.row])
        return cell
    }
}

// MARK: - EntriesViewModelDelegate

extension EntriesViewController: EntriesViewModelDelegate {
    
    func didGetEntries() {
        tableView.reloadData()
    }
    
    func getEntriesDidFail(error: Error) {
        // TODO: show error message
    }
    
    func willGetEntries() {
        // TODO: we can let the user know that there's someting loading here
    }
}
