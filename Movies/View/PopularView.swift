//
//  PopularView.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 22/09/22.
//

import SwiftUI

struct PopularView: View {
    
    @StateObject private var vm = PopularMoviesViewModel()
    
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

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView()
    }
}
