//
//  CharacterTableViewCell.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 19/12/20.
//

import UIKit
import Kingfisher

final class CharacterTableViewCell: UITableViewCell {
    
    static let kCellId = "CharacterTableViewCell"
    
    // MARK: - OUTLETS
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var statusColor: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViewCell()
    }
    
    // MARK: - METHODS
    
    func set(_ character: Character) {
        nameLabel.text = character.name
        specieLabel.text = character.species
        statusLabel.text = character.status
        
        // mover logica al model
        statusColor.textColor = { () -> UIColor in
            if character.status == "Alive" {
                return UIColor.green
            } else if character.status == "Dead"{
                return UIColor.red
            } else {
                return UIColor.gray
            }
        }()
        
        //imagen.loadImageURL(from: character.image)
        let url = URL(string: character.image)
        imagen.kf.indicatorType = .activity
        imagen.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
    
    // MARK: - PRIVATE METHODS
    
    private func configureViewCell() {        
        backgroundColor = .clear
        // sombra al contenido de la celda
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 8.0
        // pone borde redondo a card que contiene img y datos
        card.layer.cornerRadius = 16
        card.backgroundColor = .secondarySystemGroupedBackground
    }
}
