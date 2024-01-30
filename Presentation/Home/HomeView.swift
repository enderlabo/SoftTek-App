//
//  HomeView.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 29/01/24.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    var presenter: HomePresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        presenter?.onViewAppear()
    }
}

extension HomeView: listUpComingMoviesView {
    func getUpComingMovies(movies: [UpComingMoviesEntity]) {
        print(movies)
    }
}
