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
    private var currentPage = 1
    private var totalPages = 34 // default but will change with API request
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTable()
        loadRemoteData()
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
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func createSpinnerFooter() -> UIView {
        let footer = UIView(frame: CGRect(x: .zero, y: .zero, width: view.frame.size.width , height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footer.center
        footer.addSubview(spinner)
        spinner.startAnimating()
        return footer
    }
    
    func loadRemoteData() {
        tableView.tableFooterView = createSpinnerFooter()
        ApiDataManager.shared.fetchCharacters(numPage: currentPage) { personajes in
            self.characters.append(contentsOf: personajes.results)
            self.totalPages = personajes.info.pages
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.tableView.tableFooterView = nil
                self.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - TABLE DATASOURCE AND DELEGATE
extension CharacterListTableVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.kCellId, for: indexPath) as? CharacterTableViewCell {
            
            // Check if the last row number is the same as the last current data element
            // and check limit totalPages
            if indexPath.row == self.characters.count - 1 && currentPage < totalPages{
                currentPage += 1
                loadRemoteData()
            }
            
            let character = characters[indexPath.row]
            cell.setName(character)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CharacterDetailVC()
        vc.character = characters[indexPath.row]
        navigationController?.pushViewController( vc, animated: true)
    }
}

