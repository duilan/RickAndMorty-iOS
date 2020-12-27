//
//  UIImage+Ext.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 27/12/20.
//

import UIKit

extension UIImageView {
    func loadImageURL(from urlString : String) {
        let imageCache = NSCache<NSString, UIImage>()
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            print("imagen en cache \(urlString)")
            
            return
        }
        // add activity
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            print("optenemos imagen de url \(urlString)")
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }
            
        }).resume()
    }    
}
