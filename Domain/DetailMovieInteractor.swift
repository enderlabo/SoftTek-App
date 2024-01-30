//
//  DetailMovieInteractor.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Foundation

protocol DetailMovieInteractorProtocol: AnyObject {
    func fetchDetailMovie(withId id: String) async -> DetailMovieEntity
}


class DetailMovieInteractor: DetailMovieInteractorProtocol {
    func fetchDetailMovie(withId id: String) async -> DetailMovieEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=0b9e38e4c0d38766141550601db07707")!
        let (data, _ ) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! JSONDecoder().decode(DetailMovieEntity.self, from: data)
    }
}

