//
//  CharacterListTableVC.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 19/12/20.
//

import UIKit

final class CharacterListTableVC: UITableViewController {
    
    private let rowHeight: CGFloat = 150
    private let navTitle = "Rick & Morty"
    private var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTable()
        // datos de prueba
        dataPrueba()
    }
    
    // MARK: - METHODS
    func setupTable() {
        
        tableView.separatorStyle = .none
        tableView.rowHeight = rowHeight
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        
        tableView.register(UINib(nibName: CharacterTableViewCell.kCellId , bundle: nil   ), forCellReuseIdentifier: CharacterTableViewCell.kCellId)
    }
    
    func setupNavigation() {
        navigationItem.title = navTitle
    }
    
    func dataPrueba() {
        // datos de prueba
        characters = [
            Character(name: "Morty Smith", status: "Dead", specie: "Human", image: "exampleCell"),
            Character(name: "Summer Smith", status: "Alive", specie: "Human", image: "exampleCell2"),
            Character(name: "Regular Tyrion Lannister", status: "Alive", specie: "Human", image: "exampleCell"),
            Character(name: "Summer Smith", status: "Alive", specie: "Human", image: "exampleCell2"),
            Character(name: "Regular Tyrion Lannister", status: "Dead", specie: "Human", image: "exampleCell"),
            Character(name: "Summer Smith", status: "Dead", specie: "Human", image: "exampleCell2"),
            Character(name: "Regular Tyrion Lannister", status: "Dead", specie: "Human", image: "exampleCell"),
            Character(name: "Summer Smith", status: "Dead", specie: "Human", image: "exampleCell2"),
            Character(name: "Regular Tyrion Lannister", status: "Alive", specie: "Human", image: "exampleCell"),
            Character(name: "Summer Smith", status: "Dead", specie: "Human", image: "exampleCell2"),
            Character(name: "Regular Tyrion Lannister", status: "Alive", specie: "Human", image: "exampleCell"),
            Character(name: "Summer Smith", status: "Alive", specie: "Human", image: "exampleCell2"),
            Character(name: "Regular Tyrion Lannister", status: "Alive", specie: "Human", image: "exampleCell"),
            Character(name: "Pink Polo Shirt Jerry", status: "Alive", specie: "Alien", image: "exampleCell2"),
            Character(name: "Programmer", status: "Dead", specie: "Developer", image: "exampleCell")]
    }
    
}

// MARK: - TABLE DATASOURCE AND DELEGATE
extension CharacterListTableVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.kCellId, for: indexPath) as? CharacterTableViewCell {
            
            let character = characters[indexPath.row]
            cell.setName(character)
            return cell
        }
        return UITableViewCell()
    }
}

