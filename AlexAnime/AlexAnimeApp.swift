//
//  AlexAnimeApp.swift
//  AlexAnime
//
//  Created by Alex  on 10/4/24.
//

import SwiftUI

@main
struct AlexAnimeApp: App {
    @StateObject var animeListViewModel = AnimeListViewModel()
    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .environmentObject(animeListViewModel)
        }
    }
}
