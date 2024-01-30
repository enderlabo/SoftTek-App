//
//  DetailMapper.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Foundation

struct DetailMapper {
    func map(entity: DetailMovieEntity) -> DetailViewModel {
        .init(
            title: entity.title,
            overview: entity.overview,
            poster_path: URL(string: "https://image.tmdb.org/t/p/w200" + entity.poster_path),
            release_date: entity.release_date,
            overage_vote: entity.overage_vote)
   }
}
