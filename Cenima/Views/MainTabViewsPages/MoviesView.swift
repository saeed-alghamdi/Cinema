//
//  MoviesView.swift
//  Cenima
//
//  Created by RMP on 17/09/1445 AH.
//

import SwiftUI
import SDWebImageSwiftUI


struct MoviesView: View {
    
    var mainURL = "https://image.tmdb.org/t/p/w500"
    
    @State var moviesForShowingNow = readFromJSONForShowingNow()
    @State var moviesForComingUp = readFromJSONForComingUp()
    
    @State var isAnimated = true
    @State var showMovieDetialsView: Bool = false
    @State var moveInformation: [String:Any] = [:]
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { axis in
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        Text("Coming Soon").font(.title)
                        Spacer()
                    }.padding()
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: UIScreen.main.bounds.width / UIScreen.main.bounds.width - 40) {
                            
                            
                            ForEach(moviesForComingUp) { movie in
                                
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
                                    
                                    let url = URL(string: mainURL + movie.posterPath)
                                    WebImage(url: url!).resizable().aspectRatio(contentMode: .fit).cornerRadius(15.0)
                                        .frame(width: axis.size.width , height: axis.size.height / 1.8, alignment: .center).shadow(color: .primary, radius: 10)
                                    
                                }.fullScreenCover(isPresented: $showMovieDetialsView, onDismiss: nil) {
                                    
                                    MovieDetailsView(movieInfomation: $moveInformation)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    HStack {
                        Text("Showing Now").font(.title2)
                        Spacer()
                    }.padding().padding(.bottom, -10)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach(moviesForShowingNow) { movie in
                                
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
                                    
                                    showMovieDetialsView.toggle()
                                    
                                    
                                    
                                } label: {
                                    
                                    WebImage(url: URL(string: mainURL + movie.posterPath), isAnimating: $isAnimated).resizable().aspectRatio(contentMode: .fit).cornerRadius(15.0)
                                        .frame(width: axis.size.width / 2, height: axis.size.height / 2.5, alignment: .center).padding(.leading, axis.size.width / 20).shadow(color: .primary, radius: 10)
                                    
                                }.fullScreenCover(isPresented: $showMovieDetialsView, onDismiss: nil) {
                                    MovieDetailsView(movieInfomation: $moveInformation)
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }.onAppear {
                
                moviesForComingUp.shuffle()
                moviesForShowingNow.shuffle()
                
            }
            
        }
        
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
