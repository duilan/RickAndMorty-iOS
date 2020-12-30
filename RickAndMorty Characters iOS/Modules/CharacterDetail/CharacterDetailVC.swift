//
//  CharacterDetailVC.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 27/12/20.
//

import UIKit
import Kingfisher

class CharacterDetailVC: UIViewController {
    
    var character: Character?
    private let cornerRadius: CGFloat = 16
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setData()
    }
    
    func setupUI() {
        image.layer.cornerRadius = cornerRadius
    }
    
    func setData() {
        guard let characterDetail = character else { return }
        
        image.kf.setImage(with: URL(string: characterDetail.image))
        name.text = characterDetail.name
        specie.text = characterDetail.species
        status.text = characterDetail.status
    }
}
