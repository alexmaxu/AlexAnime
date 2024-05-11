//
//  URLInteractor.swift
//  AlexAnime
//
//  Created by Alex  on 11/4/24.
//

import Foundation

protocol URLInteractorProtocol {
    var bundleURL: URL { get }
    var saveURL: URL { get }
}

struct URLProduction: URLInteractorProtocol  {
    var bundleURL: URL {
        Bundle.main.url(forResource: "AnimesAC2024", withExtension: "json")!
    }
    
    var saveURL: URL {
        URL.documentsDirectory.appending(path: "savedAnimes.json")
    }
}


