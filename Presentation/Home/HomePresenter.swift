//
//  HomePresenter.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 29/01/24.
//

import Foundation

protocol listUpComingMoviesView: AnyObject {
    func getUpComingMovies(movies: [UpComingMoviesEntity])
}

class HomePresenter {
    var homeView: listUpComingMoviesView?
    private let interactor: UpComingMoviesInteractor
    
    init(interactor: UpComingMoviesInteractor) {
        self.interactor = interactor
    }
    
    func onViewAppear() {
        Task {
            let resp = await interactor.fetchUpComingMovies()
            homeView?.getUpComingMovies(movies: resp.results)
        }
    }
}
