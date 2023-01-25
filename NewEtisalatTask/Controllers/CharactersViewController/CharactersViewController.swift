//
//  CharactersViewController.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import UIKit

class CharactersViewController: UIViewController {

    init(viewModel: CharactersViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "\(CharactersViewController.self)", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - iBoutlets

    @IBOutlet private weak var characterTableView: UITableView!

    // MARK: - iVars

    private var viewModel: CharactersViewModelProtocol
    private var searchController = UISearchController()

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Title
        self.title = "Marvel Characters"

        // Data Update
        viewModel.onDataUpdate = {
            DispatchQueue.main.async { [weak self] in
                self?.characterTableView.reloadData()
            }
        }
        setupSearchBar()
        configureTableView()
    }

    // MARK: - Configure TableView

    private func configureTableView() {
        characterTableView.delegate = self
        characterTableView.dataSource = self
        characterTableView.register(UINib(nibName: String(describing: CharactersTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CharactersTableViewCell.self))
    }

    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Find your Hero"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - TableView Dtatasource

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.charactersCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = characterTableView.dequeueReusableCell(withIdentifier: String(describing: CharactersTableViewCell.self), for: indexPath) as?  CharactersTableViewCell else {
            return UITableViewCell()
        }
        let model = viewModel.getCellModel(for: indexPath.row)
        cell.configureCell(with: model)

        return cell
    }
}

//MARK: - TableView Delegate

extension CharactersViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.viewModel.onSelect(index: indexPath.row)
    }
}

extension CharactersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        viewModel.searchFor(query: textSearched)
    }
}

