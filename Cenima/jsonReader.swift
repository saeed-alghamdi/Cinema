//
//  jsonReader.swift
//  Cenima
//
//  Created by RMP on 18/09/1445 AH.
//

import Foundation


func readFromJSONForShowingNow() -> [Movie] {
    
    
    var movies: [Movie] = []
    
    
    if let urlPath = Bundle.main.url(forResource: "movie_list", withExtension: "json") {

            do {
                
                let jsonData = try Data(contentsOf: urlPath, options: .mappedIfSafe)

                if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: AnyObject] {

                    for arr in jsonDict["results"] as! NSArray {
                        
                        let dict = arr as! Dictionary<String,Any>
                        
                        if let originalLanguage = dict["original_language"], let id = dict["id"], let overview = dict["overview"], let releaseDate = dict["release_date"], let posterPath = dict["poster_path"], let originalTitle = dict["original_title"], let title = dict["title"], let voteCount = dict["vote_count"], let voteAverage = dict["vote_average"], let popularity = dict["popularity"], let backdropPath = dict["backdrop_path"] {
                            
                            let movie = Movie(originalLanguage: "\(originalLanguage)", id: id as! NSNumber, overview: "\(overview)", releaseDate: "\(releaseDate)", posterPath: "\(posterPath)", originalTitle: "\(originalTitle)", title: "\(title)", voteCount: voteCount as! NSNumber, voteAverage: voteAverage as! Double, popularity: popularity as! NSNumber, backdropPath: "\(backdropPath)", reserved: nil)
                            
                            
                            movies.append(movie)

                        }
                        
                    }
                }
            }

            catch let jsonError {
                print(jsonError)
            }
        }
    
    return movies
    
}

func readFromJSONForComingUp() -> [Movie] {
    
    
    var movies: [Movie] = []
    
    
    if let urlPath = Bundle.main.url(forResource: "comingmovies", withExtension: "json") {

            do {
                
                let jsonData = try Data(contentsOf: urlPath, options: .mappedIfSafe)

                if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: AnyObject] {

                    let comingMoviesArray = jsonDict["results"] as! NSArray
                    
                    for element in comingMoviesArray {
                        
                        let dict = element as! Dictionary<String,Any>
                        
                        if let originalLanguage = dict["original_language"], let id = dict["id"], let overview = dict["overview"], let releaseDate = dict["release_date"], let posterPath = dict["poster_path"], let originalTitle = dict["original_title"], let title = dict["title"], let voteCount = dict["vote_count"], let voteAverage = dict["vote_average"], let popularity = dict["popularity"], let backdropPath = dict["backdrop_path"] {
                            
                            let movie = Movie(originalLanguage: "\(originalLanguage)", id: id as! NSNumber, overview: "\(overview)", releaseDate: "\(releaseDate)", posterPath: "\(posterPath)", originalTitle: "\(originalTitle)", title: "\(title)", voteCount: voteCount as! NSNumber, voteAverage: voteAverage as! Double, popularity: popularity as! NSNumber, backdropPath: "\(backdropPath)", reserved: nil)
                            
                            
                            movies.append(movie)
                            
                        }
                        
                    }
                    
                }
            }

            catch let jsonError {
                print(jsonError)
            }
        }
    
    return movies
    
}



func readFromJSONForSearch() -> [Search] {
    
    var searchMovies: [Search] = []
    
    let path = Bundle.main.url(forResource: "search_movie", withExtension: "json")
    let path2 = Bundle.main.url(forResource: "movie_list", withExtension: "json")
    let path3 = Bundle.main.url(forResource: "comingmovies", withExtension: "json")
    
    if let url = path, let url2 = path2, let url3 = path3 {
        
        do {
            
            // url to data
            let dataReader = try Data(contentsOf: url)
            let dataReader2 = try Data(contentsOf: url2)
            let dataReader3 = try Data(contentsOf: url3)
            
            // data to json object
            let dataToJson = try JSONSerialization.jsonObject(with: dataReader)
            let dataToJson2 = try JSONSerialization.jsonObject(with: dataReader2)
            let dataToJson3 = try JSONSerialization.jsonObject(with: dataReader3)
            
            // json to swift dictionary
            let jsonToDictionary = dataToJson as! Dictionary<String,Any>
            let jsonToDictionary2 = dataToJson2 as! Dictionary<String,Any>
            let jsonToDictionary3 = dataToJson3 as! Dictionary<String,Any>
            
            // get results key from swift dictionary
            let results = jsonToDictionary["results"] as! NSArray
            let results2 = jsonToDictionary2["results"] as! NSArray
            let results3 = jsonToDictionary3["results"] as! NSArray
            
            // transform results to array to can read
            let arraysOfResult = results as! Array<Dictionary<String,Any>>
            let arraysOfResult2 = results2 as! Array<Dictionary<String,Any>>
            let arraysOfResult3 = results3 as! Array<Dictionary<String,Any>>
            
            
            for element in arraysOfResult {
                
                if let adult = element["adult"], let backdrop_path = element["backdrop_path"], let genre_ids = element["genre_ids"], let id = element["id"], let original_language = element["original_language"], let original_title = element["original_title"], let overview = element["overview"], let popularity = element["popularity"], let poster_path = element["poster_path"], let release_date = element["release_date"], let title = element["title"], let video = element["video"], let vote_average = element["vote_average"], let vote_count = element["vote_count"] {
                    
                    
                    let newSearch = Search(adult: adult as! Int, backdropPath: backdrop_path as? String ?? "Nothing", genreIds: genre_ids as! NSArray, id: id as! Int, originalLanguage: original_language as! String, originalTitle: original_title as! String, overview: overview as! String, popularity: popularity as! Double, posterPath: poster_path as? String ?? "Nothing", releaseDate: release_date as! String, title: title as! String, video: video as! Int, voteAverage: vote_average as! Double, voteCount: vote_count as! Int, reserved: nil)
                    
                    
                    searchMovies.append(newSearch)
                    
                    
                }
                
                
                
                
            }
            
            
            for element in arraysOfResult2 {
                
                if let adult = element["adult"], let backdrop_path = element["backdrop_path"], let genre_ids = element["genre_ids"], let id = element["id"], let original_language = element["original_language"], let original_title = element["original_title"], let overview = element["overview"], let popularity = element["popularity"], let poster_path = element["poster_path"], let release_date = element["release_date"], let title = element["title"], let video = element["video"], let vote_average = element["vote_average"], let vote_count = element["vote_count"] {
                    
                    
                    let newSearch = Search(adult: adult as! Int, backdropPath: backdrop_path as? String ?? "Nothing", genreIds: genre_ids as! NSArray, id: id as! Int, originalLanguage: original_language as! String, originalTitle: original_title as! String, overview: overview as! String, popularity: popularity as! Double, posterPath: poster_path as? String ?? "Nothing", releaseDate: release_date as! String, title: title as! String, video: video as! Int, voteAverage: vote_average as! Double, voteCount: vote_count as! Int, reserved: nil)
                    
                    
                    searchMovies.append(newSearch)
                    
                    
                }
                
            }
            
            
            for element in arraysOfResult3 {
                
                if let adult = element["adult"], let backdrop_path = element["backdrop_path"], let genre_ids = element["genre_ids"], let id = element["id"], let original_language = element["original_language"], let original_title = element["original_title"], let overview = element["overview"], let popularity = element["popularity"], let poster_path = element["poster_path"], let release_date = element["release_date"], let title = element["title"], let video = element["video"], let vote_average = element["vote_average"], let vote_count = element["vote_count"] {
                    
                    
                    let newSearch = Search(adult: adult as! Int, backdropPath: backdrop_path as? String ?? "Nothing", genreIds: genre_ids as! NSArray, id: id as! Int, originalLanguage: original_language as! String, originalTitle: original_title as! String, overview: overview as! String, popularity: popularity as! Double, posterPath: poster_path as? String ?? "Nothing", releaseDate: release_date as! String, title: title as! String, video: video as! Int, voteAverage: vote_average as! Double, voteCount: vote_count as! Int, reserved: nil)
                    
                    
                    searchMovies.append(newSearch)
                    
                    
                }
                
            }
            
        } catch let somethingWrong {
            
            fatalError(somethingWrong.localizedDescription)
            
        }
        
    }
    
    return searchMovies
    
}
