//
//  UITableView+Ext.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 12/01/21.
//

import UIKit

extension UITableView {
    
    func showSpinnerFooter() {
            let footer = UIView(frame: CGRect(x: .zero, y: .zero, width: self.frame.size.width , height: 100))
            let spinner = UIActivityIndicatorView()
        
            spinner.center = footer.center
            footer.addSubview(spinner)
            spinner.startAnimating()
            tableFooterView = footer
    }
    
    func hiddenSpinnerFooter() {
        tableFooterView = nil
    }
        
}
