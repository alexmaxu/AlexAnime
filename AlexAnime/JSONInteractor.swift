//
//  AnimeInteractor.swift
//  AlexAnime
//
//  Created by Alex  on 10/4/24.
//

import Foundation


protocol JSONInteractorProtocol {
    func getJSON<T>(url: URL, type: T.Type) throws -> T where T: Codable
    func writeJSON<JSON>(file: String, data: JSON) throws where JSON: Codable
}

extension JSONInteractorProtocol {
    func getJSON<T>(url: URL, type: T.Type) throws -> T where T: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
    
    func writeJSON<JSON>(file: String, data: JSON) throws where JSON: Codable {
        let url = URL.documentsDirectory.appending(path: file)
        print(url)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(data)
        try data.write(to: url, options: .atomic)
    }
}




