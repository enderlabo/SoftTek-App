//
//  DetailPresenter.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 29/01/24.
//

import Foundation

protocol detailViewProtocol: AnyObject {
    func getMovieById(viewModel: DetailViewModel)
}

class DetailPresenter {
    weak var view: detailViewProtocol?
    private let movieId: String
    private let interactor: DetailMovieInteractorProtocol
    private let mapper: DetailMapper
    
    init(movieId: String, interactor: DetailMovieInteractorProtocol, mapper: DetailMapper) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.fetchDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            await MainActor.run {
                self.view?.getMovieById(viewModel: viewModel)
                print(viewModel)
            }
            
        }
    }
}
