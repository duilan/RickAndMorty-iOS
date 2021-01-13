//
//  CharacterDetailVC.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 27/12/20.
//

import UIKit
import Kingfisher

final class CharacterDetailVC: UIViewController {
    
    var character: Character?
    private let navTitle = "Detail"
    
    // MARK: - OUTLETS
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUIElements()
        setDetail()
    }
    
    // MARK: - METHODS
    
    private func setDetail() {
        guard let characterDetail = character else { return }
        
        image.kf.setImage(with: URL(string: characterDetail.image))
        name.text = characterDetail.name
        specie.text = characterDetail.species
        status.text = characterDetail.status
    }

    private func configureViewController() {
        navigationItem.title = navTitle
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureUIElements() {
        image.layer.cornerRadius = 16
    }
    
    
}
