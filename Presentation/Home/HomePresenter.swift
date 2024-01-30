//
//  HomePresenter.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 29/01/24.
//

import Foundation

protocol listUpComingMoviesView: AnyObject {
    func getUpComingMovies(movies: [ViewModel])
}

class HomePresenter {
    weak var homeView: listUpComingMoviesView?
    private let interactor: UpComingMoviesInteractorProtocol
    var viewModels: [ViewModel] = []
    private let mapper: Mapper
    
    init(interactor: UpComingMoviesInteractorProtocol, mapper: Mapper = Mapper()) {
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let resp = await interactor.fetchUpComingMovies().results
            viewModels = resp.map(mapper.map(entity:))
            homeView?.getUpComingMovies(movies: viewModels)
        }
    }
}
