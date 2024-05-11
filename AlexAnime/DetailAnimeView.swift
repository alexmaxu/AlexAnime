//
//  DetailAnimeView.swift
//  AlexAnime
//
//  Created by Alex  on 16/4/24.
//

import SwiftUI

struct DetailAnimeView: View {
    let anime: Anime
    var body: some View {
        VStack {
            AsyncImage(url: anime.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.7), radius: 5)
            } placeholder: {
                ProgressView()
                    .controlSize(.extraLarge)
                    .scaledToFit()
                    .frame(width: 105)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Text(anime.title)
            Text("Year: \(anime.year)")
            Spacer()
        }
        
    }
}

#Preview {
    DetailAnimeView(anime: .previewAnime)
}
