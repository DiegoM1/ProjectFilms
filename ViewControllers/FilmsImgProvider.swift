//
//  FilmsImgProvider.swift
//  BlizzardPersonalApp
//
//  Created by Diego Monteagudo on 1/20/21.
//

import UIKit

class FilmsImgProvider {
    
    let session = URLSession(configuration: .default)
    
   
    
    func getFilmsImages(posterPath:String ,using completionHandler: @escaping (UIImage) -> ()) {
        
        let posterApiURL = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath)!
        
        let task = session.dataTask(with: posterApiURL) { (responseData, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let response = responseData else {
                return
            }
            guard let image = UIImage(data: response) else {
                return
            }
            completionHandler(image)
        }
    
        task.resume()
        
    }
}

extension UIImageView {
    func setCustomImage(path: String) {
        FilmsImgProvider().getFilmsImages(posterPath: path) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
