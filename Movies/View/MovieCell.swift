//
//  MovieCell.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 22/09/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct MovieCell: View {
    
    var movie: MovieModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                WebImage(url: movie.poster, isAnimating: .constant(false))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.5)
                        .shadow(radius: 15, x: 5, y: 5)
                Spacer()
            }
                VStack(alignment: .leading, spacing: 5) {
                    Text(movie.title ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text("IMDb")
                            .fontWeight(.bold)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 8)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary.opacity(0.5), lineWidth: 2)
                        )
                        HStack {
                            Text(String(movie.voteAverage ?? 0.0))
                                .fontWeight(.bold)
                                .font(.body)
                            .foregroundColor(.secondary)
                        }
                    }
                    Text(Helper.stringDateToString(date: movie.releaseDate))
                        .fontWeight(.bold)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.15)
                Divider()
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: exampleMovie)
    }
}
