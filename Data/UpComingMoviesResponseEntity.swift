//
//  UpComingMoviesResponseEntity.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Foundation

struct UpComingMoviesResponseEntity: Decodable {
    let results: [UpComingMoviesEntity]
}
