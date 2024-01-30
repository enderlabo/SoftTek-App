//
//  HomeView.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 29/01/24.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    private let presenter: HomePresenter
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UpComingMoviesViewCell.self, forCellReuseIdentifier: "UpConmingMoviesCell")
        return tableView
        
    }()
    
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupView()
        presenter.onViewAppear()
    }
    
    func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
    }
}
extension HomeView: listUpComingMoviesView {
    func getUpComingMovies(movies: [ViewModel]) {
        print(movies)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpConmingMoviesCell", for: indexPath) as! UpComingMoviesViewCell
        cell.backgroundColor = .black
        let model = presenter.viewModels[indexPath.row]
        
        cell.configure(model: model)
        
        return cell
    }
    
}


