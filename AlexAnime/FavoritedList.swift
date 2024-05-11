//
//  FavoritedList.swift
//  AlexAnime
//
//  Created by Alex  on 19/4/24.
//

import SwiftUI

struct FavoritedList: View {
    @EnvironmentObject var vm: AnimeListViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.favoritedAnimes, id: \.self) { anime in
                        NavigationLink(value: anime) {
                            CellView(anime: anime)
                        .swipeActions {
                            Button(action: {
                                vm.favoriteToggle(anime: anime)
                            }, label: {
                                Image(systemName: "star")
                            })
                            .tint(anime.isFavorited ? .red : .yellow)
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationDestination(for: Anime.self) { anime in
                DetailAnimeView(anime: anime)
            }
            .navigationTitle("Animes")
        }
        .searchable(text: $vm.searchText, prompt: "Search anime")
    }
}

#Preview {
    FavoritedList()
        .environmentObject(AnimeListViewModel.preview)
}
