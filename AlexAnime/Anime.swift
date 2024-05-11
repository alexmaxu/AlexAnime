//
//  Anime.swift
//  AlexAnime
//
//  Created by Alex  on 10/4/24.
//

import Foundation

struct Anime: Codable, Hashable, Identifiable  {
    let id: UUID
    let title: String
    let description: String?
    let year: Int
    let type: AnimeType
    let rateStart: String
    let votes: Int
    let status: AnimeStatus
    let followers: Int
    let episodes: Int
    let genres: [AnimeGenre]?
    let urlAnime: URL
    let image: URL
    var isFavorited: Bool
}

enum AnimeType:String, CaseIterable, Identifiable, Codable {
    var id: Self { self }
    case all = "All"
    case anime = "Anime"
    case special = "Especial"
    case ova = "OVA"
    case pelicula = "Película"
    case unknown = "Unkwnow"
    
}

enum AnimeGenre: String, CaseIterable, Identifiable, Codable {
    var id: Self { self }
    case all = "All"
    case adventures = "Aventuras"
    case scifi = "Ciencia Ficción"
    case comedy = "Comedy"
    case history = "Historico"
    case romance = "Romance"
    case fantasy = "Fantasia"
    case shounen = "Shounen"
    case magic = "Magia"
    case sobrenatural = "Sobrenatural"
    case ecchi = "Ecchi"
    case harem = "Harem"
    case seinen = "Seinen"
    case suspense = "Suspenso"
    case drama = "Drama"
    case demons = "Demons"
    case mecha = "Mecha"
    case space = "Espacial"
    case militar = "Militar"
    case police = "Policía"
    case school = "Escolares"
    case martialArts = "Artes Marciales"
    case others = "Otros"
    
}

enum AnimeStatus:String, CaseIterable, Identifiable, Codable {
    var id: Self { self }
    case all = "All"
    case finalizado = "Finalizado"
    case enEmision = "En emision"
    case proximamente = "Proximamente"
    
    
}

enum OrderBy: String, Identifiable, CaseIterable {
    var id: OrderBy { self }
    
    case title = "Title"
    case titleDescendent = "Title descendent"
    case rating = "Rating"
    case year = "Year"
    case yearDescendet = "Year Descendent"
}

enum FilterOptions: String, CaseIterable, Identifiable {
    var id: FilterOptions { self }
    case animeStatus = "Anime Status"
    case animeGenre = "Anime Genre"
    case animeType = "Anime Type"
    
}
