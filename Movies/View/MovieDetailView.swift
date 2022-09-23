//
//  MovieDetailView.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 23/09/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    var movie: MovieModel
    @StateObject private var vm = MovieDetailsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(alignment: .leading) {
                    WebImage(url: movie.poster, isAnimating: .constant(false))
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .bottom) {
                            Text(movie.title ?? "")
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                        }
                        if let adult = movie.adult, adult {
                            Text("18 +")
                                .foregroundColor(Color("Reverse"))
                                .font(.footnote)
                                .bold()
                                .padding(5)
                                .background(Color.primary)
                                .cornerRadius(5)
                        }
                        HStack {
                            Text("IMDb")
                                .fontWeight(.bold)
                                .font(.caption)
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
                        
                        HStack {
                            Text("Released On")
                                .fontWeight(.bold)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary.opacity(0.5), lineWidth: 2)
                                )
                            Text(Helper.stringDateToString(date: movie.releaseDate))
                                .fontWeight(.bold)
                                .font(.body)
                            .foregroundColor(.secondary)
                            
                        }
                        
                        Button {
                            playVideo()
                        } label: {
                            Spacer()
                            HStack {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                Spacer()
                                    .frame(width: 30)
                                Text("Watch Trailer")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .background(Color.blue)
                            .cornerRadius(10)
                            Spacer()
                        }
                        .padding(.vertical)

                        
                        Text("OverView")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                        Text(movie.overview ?? "")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward.circle.fill")
                    .renderingMode(.original)
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
            }.padding(10)
        }
        .onAppear() {
            guard let id = movie.id else { return }
            vm.fetchVideos(id: id)
        }
    }
    
    func playVideo() {
        if let video = vm.movieVideos.filter({ $0.site == "YouTube" && $0.official == true }).first {
            print(video.videoURL)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exampleMovie)
    }
}
