//
//  ContentView.swift
//  AlexAnime
//
//  Created by Alex  on 10/4/24.
//

import SwiftUI

struct AnimeListView: View {
    @EnvironmentObject var vm: AnimeListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.filteredAnimes) { anime in
                    NavigationLink(value: anime) {
                        CellView(anime: anime)
                    }
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            vm.favoriteToggle(anime: anime)
                        }, label: {
                            Image(systemName: "star")
                        })
                        .tint(anime.isFavorited ? .red : .yellow)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role:.destructive, action: {
                            vm.removeAnime(anime: anime)
                        }, label: {
                            Image(systemName: "trash")
                        })
                    }
                    
                }
                
            }
            .listStyle(.grouped)
            .navigationDestination(for: Anime.self) { anime in
                DetailAnimeView(anime: anime)
            }
            .navigationTitle("Animes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarFilterView()
                }
            }
        }
        .refreshable {
            vm.getAnimes()
        }
        .alert(vm.errorMesage, isPresented: $vm.showAlert, actions: {
            Button {
                vm.getAnimes()
            } label: {
                Text("Try again.")
            }

        })
        .searchable(text: $vm.searchText, prompt: "Search anime")
    }
}

#Preview {
    AnimeListView.preview
}
