//
//  Mapper.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Foundation

struct Mapper {
    func map(entity: UpComingMoviesEntity) -> ViewModel {
        ViewModel(title: entity.title, poster_path: URL(string: "https://image.tmdb.org/t/p/w500" + entity.poster_path))
    }
}
