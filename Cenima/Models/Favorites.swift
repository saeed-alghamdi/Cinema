//
//  Favorites.swift
//  Movies
//
//  
//

import Foundation


struct Favorite: Identifiable {
    
    var id = UUID()
    let poster: String
    let title: String
    let releaseDate: String
    let popularity: NSNumber
    let originalLanguage: String
    let average: Double
    let overview: String
    let favorite: String
    
}
