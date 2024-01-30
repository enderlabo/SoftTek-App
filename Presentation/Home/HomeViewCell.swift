//
//  HomeViewCell.swift
//  SoftTek_Movies_App
//
//  Created by Elderson Laborit on 30/01/24.
//

import Foundation
import UIKit
import Kingfisher

class UpComingMoviesViewCell: UITableViewCell {
    let upComingMovieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let upComingMovieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 36,weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not  been implemented")
    }
    
    func setupViews() {
        addSubview(upComingMovieImageView)
        addSubview(upComingMovieName)
        
        NSLayoutConstraint.activate([
            upComingMovieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            upComingMovieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            upComingMovieImageView.heightAnchor.constraint(equalToConstant: 200),
            upComingMovieImageView.widthAnchor.constraint(equalToConstant: 100),
            upComingMovieImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            upComingMovieName.leadingAnchor.constraint(equalTo: upComingMovieImageView.trailingAnchor, constant: 32),
            upComingMovieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            upComingMovieName.topAnchor.constraint(equalTo: topAnchor, constant: 100)
        ])
    }
    
    func configure(model: ViewModel) {
        upComingMovieImageView.kf.setImage(with: model.poster_path)
        upComingMovieName.text = model.title
    }
}
