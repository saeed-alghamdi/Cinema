//
//  ReservationsView.swift
//  Cenima
//
//  Created by RMP on 23/09/1445 AH.
//

import SwiftUI
import SDWebImageSwiftUI


// Empty View
struct ReservationEmptyView: View {
    
    var body: some View {
        
        NavigationView {
            
            Text("No Reservations 🚫").navigationTitle("Reservations").navigationBarTitleDisplayMode(.large)
            
        }
        
    }
    
}

struct ReservationsView: View {

    @FetchRequest(entity: ReservationModel.entity() , sortDescriptors: [.init(key: "movieTitle", ascending: true)])
    
    
    var reservationsMoviesCoreData: FetchedResults<ReservationModel>

    @State var showMovieDetialsView: Bool = false
    
    
    @State var moveInformation: [String:Any] = [:]

    
    var body: some View {

        if reservationsMoviesCoreData.isEmpty {
            
            ReservationEmptyView()
            
        } else {
            
            NavigationView {

                ScrollView(showsIndicators: false) {

                    
                    ForEach(reservationsMoviesCoreData) { movie in
                        
                        Button {
                            
                            
                            let movieInfo: [String:Any] = [
                                
                                "originalLanguage":movie.movieOriginalLanguage ?? "No Language",
                                "title":movie.movieTitle ?? "No Title",
                                "poster":movie.movieUrl ?? URL(string: "")!,
                                "overview":movie.movieOverView ?? "No Overview",
                                "releaseDate":movie.movieReleaseDate ?? "No Date",
                                "vote":movie.movieVote,
                                "average":movie.movieVote,
                                "popularity":movie.moviePopularity,
                                "backdropPath": movie.movieBackdropPath ?? URL(string: "")!,
                                "movieReserved": movie.movieReserved
                                
                                
                            ]
                            
                            moveInformation = movieInfo
                            showMovieDetialsView = true
                            
                            
                        } label: {
                            
                            VStack {
                                
                                let url = movie.movieUrl ?? nil
                                
                                WebImage(url: url!).resizable().aspectRatio(contentMode: .fit).cornerRadius(15.0)
                                    .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.7, alignment: .center)
                                
                                Text(movie.movieTitle ?? "No Title").font(.title2).bold().padding(.bottom, 30)
                                
                                
                                
                            }
                            
                        }.fullScreenCover(isPresented: $showMovieDetialsView) {
                            
                            MovieDetailsView(movieInfomation: $moveInformation)
                            
                        }

                    }
                    

                }.navigationTitle("Reservations").navigationBarTitleDisplayMode(.large)

            }
            
        }

    }

}

struct ReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationsView()
    }
}
