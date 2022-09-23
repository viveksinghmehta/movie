//
//  TopRatedView.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 22/09/22.
//

import SwiftUI

struct TopRatedView: View {
    
    @StateObject private var vm = TopRatedMoviesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(vm.movies, id: \.id) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            MovieCell(movie: movie)
                                .onAppear() {
                                    vm.loadMoreContent(currentMovie: movie)
                                }
                        }
                    }
                }
            }
            .navigationTitle("Popular Movies")
        }
    }
}

struct TopRatedView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedView()
    }
}
