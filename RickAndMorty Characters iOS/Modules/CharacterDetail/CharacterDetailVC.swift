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
    private let navTitle = "Detail"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
        setData()
    }
    
    func setupUI() {
        image.layer.cornerRadius = cornerRadius
    }
    
    func setupNavigation() {
        navigationItem.title = navTitle
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setData() {
        guard let characterDetail = character else { return }
        
        image.kf.setImage(with: URL(string: characterDetail.image))
        name.text = characterDetail.name
        specie.text = characterDetail.species
        status.text = characterDetail.status
    }
}
