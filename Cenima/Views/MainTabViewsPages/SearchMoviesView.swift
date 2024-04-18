//
//  SearchMoviesView.swift
//  Cenima
//
//  Created by RMP on 20/09/1445 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchMoviesView: View {
    
    
    @State var searchMovies: [Search] = readFromJSONForSearch()
    
    @State var searchTerm: String = ""
    
    
    @State var showMovieDetialsView: Bool = false
    @State var moveInformation: [String:Any] = [:]
    
    
    let mainUrl = "https://image.tmdb.org/t/p/w500"
    
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                ForEach(filteredMovies, id: \.id) { movie in
                    
                    Button {
                        
                        
                        let movieInfo: [String:Any] = [
                            
                            "originalLanguage":movie.originalLanguage,
                            "title":movie.title,
                            "poster":movie.posterPath,
                            "backdropPath":movie.backdropPath,
                            "overview":movie.overview,
                            "releaseDate":movie.releaseDate,
                            "vote":movie.voteCount,
                            "average":movie.voteAverage,
                            "popularity":movie.popularity,
                            "movieReserved": false
                            
                            
                        ]
                        
                        moveInformation = movieInfo
                        showMovieDetialsView = true
                        
                        
                    } label: {
                        
                        VStack {
                            
                            let url = URL(string: mainUrl + movie.posterPath)
                            
                            WebImage(url: url!).resizable().aspectRatio(contentMode: .fit).cornerRadius(15.0)
                                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.7, alignment: .center)
                            
                            Text(movie.title).font(.title2).bold().padding(.bottom, 30)
                            
                            
                            
                        }
                        
                    }.fullScreenCover(isPresented: $showMovieDetialsView) {
                        
                        MovieDetailsView(movieInfomation: $moveInformation)
                        
                    }

                }
                
            }.navigationTitle("Search Movie").searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always), prompt: "Movie Name").onAppear {
                
                searchMovies.shuffle()
                
            }
            
        }
        
    }
    
}

struct SearchMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMoviesView()
    }
}



// Search Method
extension SearchMoviesView {
    
    var filteredMovies: [Search] {
        
        guard !searchTerm.isEmpty else { return searchMovies}
        return searchMovies.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }
        
    }
    
}
