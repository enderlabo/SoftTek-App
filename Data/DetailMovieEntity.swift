//
//  DetailMovieEntity.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Foundation


struct DetailMovieEntity: Decodable {
    
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
    let overage_vote: Double
}
