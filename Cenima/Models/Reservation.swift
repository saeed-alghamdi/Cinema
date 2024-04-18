//
//  Reservation.swift
//  Movies
//
//  
//

import Foundation


struct Reservation: Identifiable {
    
    var id = UUID()
    let poster: String
    let title: String
    let releaseDate: String
    let popularity: NSNumber
    let originalLanguage: String
    let average: Int
    let overview: String
    let reserved: Bool
    
}
