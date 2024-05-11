//
//  AnimeInteractor.swift
//  AlexAnime
//
//  Created by Alex  on 11/4/24.
//

import Foundation

struct AnimeInteractor: JSONInteractorProtocol, URLInteractorProtocol {
    
    static let shared = AnimeInteractor()
    
    let urlInteractor: URLInteractorProtocol
    let bundleURL: URL
    let saveURL: URL
    
    init(urlInteractor: URLInteractorProtocol = URLProduction()) {
        self.urlInteractor = urlInteractor
        self.bundleURL = urlInteractor.bundleURL
        self.saveURL = urlInteractor.saveURL
    }
    
    func loadAnimes() throws -> [Anime] {
        if FileManager.default.fileExists(atPath: saveURL.path()) {
            try getJSON(url: saveURL, type: [Anime].self)
        } else {
            try getJSON(url: bundleURL, type: [AnimeDTO].self).map {$0.toAnime}
        }
    }
    
    func saveAnimes(animes: [Anime]) throws {
        try writeJSON(file: saveURL.lastPathComponent, data: animes)
    }
    
}

