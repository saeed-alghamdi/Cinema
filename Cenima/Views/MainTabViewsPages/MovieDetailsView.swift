//
//  MovieDetailsView.swift
//  Cenima
//
//  Created by RMP on 18/09/1445 AH.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData
import ToastSwiftUI

struct MovieDetailsView: View {
    
    var mainURL = "https://image.tmdb.org/t/p/w500"
    
    @Binding var movieInfomation: [String:Any]
   
    @State var isFavorite = false
    
    @State var isCoreDataSavingSuccessfully: Bool = Bool()
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @FetchRequest(entity: ReservationModel.entity() , sortDescriptors: [.init(key: "movieTitle", ascending: true)])
    var moviesReservations: FetchedResults<ReservationModel>
    
    
    var body: some View {
        
        let title = movieInfomation["title"]! as! String
        let poster = mainURL + "\(movieInfomation["poster"]!)"
        let overview = movieInfomation["overview"]! as! String
        let releaseDate = movieInfomation["releaseDate"]! as! String
        let average = movieInfomation["average"]! as? Double
        let originalLanguage = movieInfomation["originalLanguage"]! as! String
        let popularity = movieInfomation["popularity"]! as! NSNumber
        let backdropPath = movieInfomation["backdropPath"] as! String
        var isMovieReserved = movieInfomation["movieReserved"] as! Bool
        //let vote = movieInfomation["vote"] as! Int
        
        NavigationView {
            
            GeometryReader { axis in
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    VStack {
                        
                        VStack {
                            
                            WebImage(url: URL(string: poster)).resizable().aspectRatio(contentMode: .fit).cornerRadius(15.0).frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2, alignment: .center).shadow(color: .primary, radius: 10, x: 0, y: 0)
                            
                            Text(title).bold().multilineTextAlignment(.center).font(.title)
                            
                        }.padding()
                        
                        
                        Text("Story: \(overview)").font(.footnote).multilineTextAlignment(.center).padding()
                        
                        
                        VStack() {
                            
                            HStack {
                                
                                Text("Date: ").font(.footnote).multilineTextAlignment(.center)
                                Text("\(releaseDate)").font(.footnote).fontWeight(.semibold).multilineTextAlignment(.center)
                                
                            }
                            
                            HStack {
                                
                                Text("Popularity: ").font(.footnote).multilineTextAlignment(.center)
                                Text("\(popularity)").font(.footnote).fontWeight(.semibold).multilineTextAlignment(.center)
                                
                            }
                            
                            HStack {
                                
                                
                                if let average = average {
                                    Text("Average: ").font(.footnote).multilineTextAlignment(.center)
                                    Text("\(average.formatted())").font(.footnote).fontWeight(.semibold).multilineTextAlignment(.center)
                                }
                                
                                
                            }
                            
                            HStack {
                                
                                Text("Language: ").font(.footnote).multilineTextAlignment(.center)
                                Text("\(originalLanguage.uppercased())").font(.footnote).fontWeight(.semibold).multilineTextAlignment(.center)
                                
                            }
                            
                        }
                        
                        HStack() {
                            
                        
                            
                            // Reservation To CoreData
                            Button {
                                
                                isCoreDataSavingSuccessfully.toggle()
                                
                                if isMovieReserved == false {
                                    
                                    isMovieReserved = true
                                    addMovieToCoreData(movieTitle: title, movieOriginalLanguage: originalLanguage, movieOverview: overview, movieReleaseDate: releaseDate, moviePosterUrl: poster, movieVote: 0.0, movieBackdropPath: backdropPath, moviePopularity: popularity, movieAvarege: Int(Int16(average ?? 0)), movieReserved: isMovieReserved)
                                    
                                } else {
                                    
                                    isMovieReserved = false
                                    deleteMovieFromCoreData(movieTitle: title)
                                    
                                }
                                
                            
                                
                                
                            } label: {
                                
                                Text(isMovieReserved ? "Delete a ticket" : "Reserve a ticket" ).padding().background(Color.yellow).cornerRadius(20).foregroundColor(.black)
                                
                            }
                            
                            Spacer()
                            
                            Button (action: {
                                
                                isFavorite.toggle()
                                
                                
                            }, label:{
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit).frame(width: 30, height: 30).foregroundColor(isFavorite ? .red : .gray)
                                
                            })
                            
                        }.padding()
                        
                    }
                    
                    
                }
                
                
            }.toast(isPresenting: $isCoreDataSavingSuccessfully, message: isMovieReserved ? "Delete successfully" : "Save successfully", icon: .success).toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        
                        Image(systemName: "chevron.down").foregroundColor(.yellow)
                        
                    }


                }
                
            }
            
        }
        
    }
}



//struct MovieDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsView(movieInfomation: .constant([:]))
//
//    }
//}



extension MovieDetailsView {
    
    func addMovieToCoreData(movieTitle: String, movieOriginalLanguage: String, movieOverview: String, movieReleaseDate: String, moviePosterUrl: String, movieVote: Double, movieBackdropPath: String, moviePopularity: NSNumber, movieAvarege: Int, movieReserved: Bool) {
        
        let movie = ReservationModel(context: managedObjectContext)
        movie.movieTitle = movieTitle
        movie.movieOriginalLanguage = movieOriginalLanguage
        movie.movieOverView = movieOverview
        movie.movieReleaseDate = movieReleaseDate
        movie.movieUrl = URL(string: moviePosterUrl)
        //movie.movieVote = Int16(movieVote)
        movie.movieBackdropPath = movieBackdropPath
        movie.moviePopularity = Double(truncating: moviePopularity)
//        movie.movieAvarage = movieAvarege
        //movie.movieAvarage = Int16(movieAvarege)
        
        movie.movieReserved = movieReserved
        
        do {
            
            try managedObjectContext.save()
            
            
        } catch let somethingWrong {
            
            fatalError("wrong in coredata saving: \(somethingWrong.localizedDescription)")
            
        }
        
    }
    
    
    func deleteMovieFromCoreData(movieTitle: String) {
        
        
        let items = moviesReservations.filter { $0.movieTitle == movieTitle }
        
        for item in items {
            
            managedObjectContext.delete(item)
            
        }
        
        do {
            
            try managedObjectContext.save()
            
            
        } catch let somethingWrong {
            
            fatalError("wrong in coredata delete: \(somethingWrong.localizedDescription)")
            
        }
        
        
    }
    
}
