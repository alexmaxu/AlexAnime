//
//  Model.swift
//  AlexAnime
//
//  Created by Alex  on 10/4/24.
//

import Foundation

struct AnimeDTO: Codable {
    let title: String
    let description: String?
    let year: Int
    let type: AnimeType
    let rateStart: String
    let votes: Int
    let status: AnimeStatus
    let followers: Int
    let episodes: Int
    let genres: String?
    let urlAnime: URL
    let image: URL
    
    var toAnime: Anime {
        Anime(
            id: UUID(),
            title: title,
            description: description,
            year: year,
            type: type,
            rateStart: rateStart,
            votes: votes,
            status: status,
            followers: followers,
            episodes: episodes,
            genres: genres?.components(separatedBy: ",").compactMap({ AnimeGenre(rawValue: $0) }),
            urlAnime: urlAnime,
            image: image,
            isFavorited: false
        )
    }
    
    enum CodingKeys: String, CodingKey {
        case title, description, year, type, votes, status, followers, episodes, genres, image
        case rateStart = "rate_start", urlAnime = "url_anime"
    }
}

