//
//  CellView.swift
//  AlexAnime
//
//  Created by Alex  on 12/4/24.
//

import SwiftUI

struct CellView: View {
    let anime: Anime
    var body: some View {
        HStack (spacing: 16) {
            AsyncImage(url: anime.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 105, height: 155)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.7), radius: 5)
                    .overlay(alignment: .bottomLeading) {
                        Image(systemName: "heart.fill" )
                            .foregroundStyle(Color.red)
                            .padding(4)
                            .opacity(anime.isFavorited ? 1 : 0)
                    }
            } placeholder: {
                ProgressView()
                    .controlSize(.extraLarge)
                    .scaledToFit()
                    .frame(width: 105, height: 155)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            ZStack (alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(height: 155)
                
                VStack (alignment: .leading, spacing: 8) {
                    Text(anime.title)
                        .bold()
                        .font(.callout)
                    Text("Episodes: \(anime.episodes)")
                    HStack {
                        Text("Rate:")
                            .font(.callout)
                        StarView(number: anime.rateStart)
                    }
                    Image(systemName: anime.isFavorited ? "star.fill" : "star" )
                        .foregroundStyle(Color(.yellow))
                        
                }
                
                .padding()
            }
        }
    }
}



#Preview {
    List {
        CellView(anime: .previewAnime)
    }
}
