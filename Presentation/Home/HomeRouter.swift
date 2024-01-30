//
//  HomeRouter.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 29/01/24.
//

import Foundation
import UIKit

class HomeRouter {
    func showHomeView(window: UIWindow?) {
        let interactor = UpComingMoviesInteractor()
        let presenter = HomePresenter(interactor: interactor)
        let view = HomeView(presenter: presenter)
        
        presenter.homeView = view
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
