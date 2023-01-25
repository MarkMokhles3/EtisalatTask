//
//  CharactersDetailsViewController.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import UIKit

class CharactersDetailsViewController: UIViewController {

    // MARK: - init

    init(viewModel: CharactersDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "\(CharactersDetailsViewController.self)", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - iBOutlets
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!

    // MARK: - Private iVars

    private var viewModel: CharactersDetailsViewModelProtocol

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private iFunc

    private func setupView() {
        lblName.text = viewModel.name
        lblDescription.text = viewModel.description
        guard let imageURL = viewModel.image else { return }
        imageHero.load(urlString: imageURL)
    }
}
