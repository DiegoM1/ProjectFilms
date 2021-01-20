//
//  FilmResponse.swift
//  BlizzardPersonalApp
//
//  Created by Diego Monteagudo on 1/19/21.
//

import UIKit

struct FilmResponse : Codable {
    let results : [Film]
    enum CodinKeys: String, CodingKey {
        case results = "results"
    }
}
struct Film : Codable, Equatable{
    let video: Bool
    let vote_average: Double
    let overview: String
    let release_date: String
    let vote_count: Int
    let adult: Bool
    let backdrop_path: String?
    let title: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let poster_path: String
    let popularity: Double
    let media_type: String
    
    enum CodingKeys: String, CodingKey {
        case video
        case vote_average
        case overview
        case release_date
        case vote_count
        case adult
        case backdrop_path
        case title
        case genre_ids
        case id
        case original_language
        case original_title
        case poster_path
        case popularity
        case media_type
     }
}
