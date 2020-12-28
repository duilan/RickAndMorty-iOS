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
    @IBOutlet weak var image: UIImageView!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }

    func setData() {
        if let imageUrlString =  character?.image{
            let url = URL(string: imageUrlString)
            image.kf.setImage(with: url)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
