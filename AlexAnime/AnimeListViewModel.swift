//
//  AnimeListViewModel.swift
//  AlexAnime
//
//  Created by Alex  on 11/4/24.
//

import Foundation

final class AnimeListViewModel: ObservableObject {
    
    let animeInteractor: AnimeInteractor
    
    @Published var animes: [Anime] = [] {
        didSet {
            try? animeInteractor.saveAnimes(animes: animes)
        }
    }
    @Published var orderAll: Bool = false
    @Published var orderedBy: OrderBy = .title
    @Published var orderedType: AnimeType = .all
    @Published var orderedGenre: AnimeGenre = .all
    @Published var orderedStatus: AnimeStatus = .all
    
    @Published var searchText = ""
    @Published var errorMesage = ""
    @Published var showAlert: Bool = false
    
    var favoritedAnimes: [Anime] {
        animes
            .filter { $0.isFavorited }
            .filter { searchFilter(anime: $0) }
    }
    
    var filteredAnimes: [Anime] {
        animes
            .filter { searchFilter(anime: $0) }
        
            .filter { orderedTypeAnime(anime: $0) }
            .filter { orderedStatusAnime(anime: $0) }
            .filter { orderedGenreAnime(anime: $0) }
        
            .sorted { orderAnime(anime1: $0, anime2: $1) }
    }
    
    init(animeInteractor: AnimeInteractor = AnimeInteractor()) {
        self.animeInteractor = animeInteractor
        getAnimes()
    }
    
    func removeAnime(anime: Anime) {
        
        if let index = animes.firstIndex(of: anime) {
            animes.remove(at: index)
        }
        
    }
    
    func searchFilter(anime: Anime) -> Bool {
        if searchText.isEmpty {
            true
        } else {
            anime.title.localizedStandardContains(searchText)
        }
    }
    
    func getAnimes() {
        do {
            self.animes = try animeInteractor.loadAnimes()
        } catch {
            errorMesage = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func orderAnime(anime1: Anime, anime2: Anime) -> Bool {
        switch orderedBy {
        case .title:
            anime1.title < anime2.title
        case .titleDescendent:
            anime1.title > anime2.title
        case .rating:
            anime1.rateStart > anime2.rateStart
        case .year:
            anime1.year > anime2.year
        case .yearDescendet:
            anime1.year < anime2.year
        }
    }
    
    
    func orderedTypeAnime (anime: Anime) -> Bool {
        if !(orderedType == .all) {
            return anime.type == orderedType
        }
        return true
    }
    
    func orderedStatusAnime (anime: Anime) -> Bool {
        if !(orderedStatus == .all) {
            return anime.status == orderedStatus
        }
        return true
    }
    
    func orderedGenreAnime (anime: Anime) -> Bool {
        if !(orderedGenre == .all) {
            return anime.genres?.contains(orderedGenre) ?? true
        }
        return true
    }
    
    func favoriteToggle(anime:Anime) {
        if let index = animes.firstIndex(of: anime) {
            print(animes[index].isFavorited)
            animes[index].isFavorited.toggle()
            print(animes[index].isFavorited)
        }
    }
    
    
    
    
    //    func sortList() -> [Anime] {
    //        if !searchText.isEmpty {
    //            animes.filter { anime in
    //                anime.title.localizedStandardContains(searchText)
    //            }
    //        } else {
    //            animes
    //        }
    //    }
    
    
}



