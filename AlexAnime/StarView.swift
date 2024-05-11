//
//  StarView.swift
//  AlexAnime
//
//  Created by Alex  on 14/4/24.
//

import SwiftUI

struct StarView: View {
    
    let number: String
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(Double(number) ?? 0) ? "star.fill" : "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
            }
        }
    }
}

#Preview {
    StarView(number: "3")
}
