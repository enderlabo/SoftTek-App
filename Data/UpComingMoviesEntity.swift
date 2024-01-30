//
//  UpComingMoviesEntity.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Network

struct UpComingMoviesEntity: Decodable {
    
    let id: Int
    let poster_path: String
    let title: String
    let vote_average: Double
    let release_date: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case title = "title"
        case vote_average = "vote_average"
        }
}
