//
//  Movie.swift
//  Cenima
//
//  Created by RMP on 18/09/1445 AH.
//

import Foundation

struct Movie: Identifiable {
    
    let uuid = UUID()
    
    let originalLanguage: String
    let id: NSNumber
    let overview: String
    let releaseDate: String
    let posterPath: String
    let originalTitle: String
    let title: String
    let voteCount: NSNumber
    let voteAverage: Double
    let popularity: NSNumber
    let backdropPath: String
    let reserved: Bool?
    
}
