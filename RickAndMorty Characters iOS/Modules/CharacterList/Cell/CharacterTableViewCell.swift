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
    
    private let cornerRadius: CGFloat = 16
    private let shadowRadius: CGFloat = 8.0
    private let shadowOpacity: Float = 0.2
    private let shadowOffset: CGSize = .zero
    private let shadowColor: UIColor = UIColor.black
    private let scaleTransformCard: CGFloat = 0.97
    private let durationTransformCard = 0.2
    
    // MARK: - OUTLETS
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var statusColor: UILabel!
    @IBOutlet weak var statusText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - METHODS
    
    func setName(_ character: Character) {
        label.text = character.name
        specie.text = character.species
        statusText.text = character.status
        
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
    
    private func setupUI() {
        // color de fondo
        backgroundColor = .clear
        // pone borde redondo a card que contiene img y datos
        card.layer.cornerRadius = cornerRadius
        // sombra al contenido de la celda
        setShadow()
    }
    
    private func setShadow() {
        // sombra al contenido de la celda
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
}

// MARK: - ANIMATE TOUCH CELL
extension CharacterTableViewCell {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.card.transform  = CGAffineTransform(scaleX: 1.0, y: 1.0)
            UIView.animate(withDuration: self.durationTransformCard, delay: 0.0, options: .curveLinear, animations: {
                self.card.transform  = CGAffineTransform(scaleX: self.scaleTransformCard, y: self.scaleTransformCard)
            }, completion: nil)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.card.transform  = CGAffineTransform(scaleX: self.scaleTransformCard, y: self.scaleTransformCard)
            UIView.animate(withDuration: self.durationTransformCard, delay: 0.0, options: .curveLinear, animations: {
                self.card.transform  = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.card.transform  = CGAffineTransform(scaleX: self.scaleTransformCard, y: self.scaleTransformCard)
            UIView.animate(withDuration: self.durationTransformCard, delay: 0.0, options: .curveLinear, animations: {
                self.card.transform  = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
}
