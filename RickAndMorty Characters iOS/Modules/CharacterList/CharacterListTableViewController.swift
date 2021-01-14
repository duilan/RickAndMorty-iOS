//
//  CharacterListTableVC.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 19/12/20.
//

import UIKit

final class CharacterListTableVC: UIViewController {
    
    private let navTitle = "Rick & Morty"
    private var characters = [Character]()
    private var currentPage = 1
    private var totalPages = 34 // default but will change with API request
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTable()
        getCharacters()
    }
    
    // MARK: - METHODS
    
    private func configureViewController() {
        navigationItem.title = navTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTable() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.rowHeight = 150
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: CharacterTableViewCell.kCellId , bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.kCellId)
    }
    
    private func getCharacters() {
        tableView.showSpinnerFooter()
        APIDataManager.shared.fetchCharacters(numPage: currentPage) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success( let personajes):
                self.characters.append(contentsOf: personajes.results)
                self.totalPages = personajes.info.pages
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.tableView.hiddenSpinnerFooter()
                    self.tableView.reloadData()
                }
            case .failure( let error):
                print(error.rawValue)
            }
        }
    }
    
}

// MARK: - TABLE DATASOURCE AND DELEGATE

extension CharacterListTableVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.kCellId, for: indexPath) as? CharacterTableViewCell {
            
            // load new data by page
            let lastRow = self.characters.count - 1
            if indexPath.row == lastRow && currentPage < totalPages {
                currentPage += 1
                getCharacters()
            }
            
            let character = characters[indexPath.row]
            cell.set(character)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CharacterDetailVC()
        vc.character = characters[indexPath.row]
        navigationController?.pushViewController( vc, animated: true)
    }
}
