//
//  HomeTabView.swift
//  AlexAnime
//
//  Created by Alex  on 19/4/24.
//

import SwiftUI

struct HomeTabView: View {
    
    var body: some View {
        TabView {
            AnimeListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            FavoritedList()
                .tabItem { Label("Favorited", systemImage: "star.fill") }
            
        }
        
    }
}

#Preview {
    HomeTabView()
        .environmentObject(AnimeListViewModel())
}
