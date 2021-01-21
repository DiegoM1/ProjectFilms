//
//  FilmsDataProvider.swift
//  BlizzardPersonalApp
//
//  Created by Diego Monteagudo on 1/19/21.
//

import UIKit

public let filmsApiKey = "1f54bd990f1cdfb230adb312546d765d"


protocol FilmDataRequestProtocol {
    func getFilmsData(page: Int, using completionHandler: @escaping (FilmResponse) -> ())
}

class FilmsDataProvider: FilmDataRequestProtocol {
    
    let session = URLSession(configuration: .default)
    
    func getFilmsData(page: Int, using completionHandler: @escaping (FilmResponse) -> ()) {
        let apiURL = URL(string:"https://api.themoviedb.org/3/trending/movie/day?api_key=" + filmsApiKey + "&page=" + String(page))!
        let task = session.dataTask(with: apiURL) { (responseData, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = responseData,
                  let response = try? JSONDecoder().decode(FilmResponse.self, from: data) else {
                completionHandler(FilmResponse(results: []))
                return
            }
    
            completionHandler(response)
        }
        task.resume()
    }
    
}

