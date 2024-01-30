//
//  UpComingMoviesInteractor.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Foundation

protocol UpComingMoviesInteractorProtocol {
    func fetchUpComingMovies() async -> UpComingMoviesResponseEntity
}

class UpComingMoviesInteractor: UpComingMoviesInteractorProtocol {
    func fetchUpComingMovies() async -> UpComingMoviesResponseEntity {
        //MARK: - TODO: Remove the string and put a Constants.
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?_page=1&api_key=0b9e38e4c0d38766141550601db07707")!
        let (data, _ ) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(UpComingMoviesResponseEntity.self, from: data)
    }
}
