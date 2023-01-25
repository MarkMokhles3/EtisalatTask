//
//  CharactersTableViewCell.swift
//  NewEtisalatTask
//
//  Created by Mark Mokhles on 25/01/2023.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    // MARK: - iBOutlets

    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblCharacterNameValue: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var stackViewDescription: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func prepareForReuse() {
        imgCharacter.image = nil
    }

    // MARK: - Configure Cell

    func configureCell(with character: Character) {
        //Name
        guard let characterName = character.name else { return }
        lblCharacterNameValue.text = characterName

        //Description
        if character.description?.isEmpty == true
        {
            stackViewDescription.isHidden = true
        } else {
            stackViewDescription.isHidden = false
            lblDescription.text = character.description
        }

        //ImageURL
        let url =  getImageURL(from: character)
        guard let imageURL = url else { return }
        imgCharacter.load(urlString: imageURL)
    }

    // MARK: - Get ImageURL

    func getImageURL(from character: Character) -> String? {

        let thumbnailpath = character.thumbnail?.path ?? ""
        let thumbnailExtension = character.thumbnail?.thumbnailExtension ?? ""
        let imageURL = "\(thumbnailpath)/portrait_medium.\(thumbnailExtension)"
        
        return imageURL
    }

    // MARK: - SetupView

    func setupView() {
        imgCharacter.setRoundCorners(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: 5)
        //Set corner and shadow to view
        viewContainer.setCornerRadius(radius: 5)
        viewContainer.setShadow(radius: 1, opacity: 0.5)
    }
}

