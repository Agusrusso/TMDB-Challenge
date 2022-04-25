//
//  MovieTableViewCell.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import UIKit

// CONTENTVIEW: Contenedor del tableviewcell donde viven todos los controles visuales
class MovieTableViewCell: UITableViewCell {

    var name: String? {
        didSet {
            movieName.text = name
        }
    }
    
    private lazy var placehoderImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.backgroundColor = .lightGray                    //VER CAMBIAR EL COLOR!!!!!
        aImage.image = UIImage(named: "short")
        return aImage
    }()
    
    private lazy var movieName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .darkGray                   //VER CAMBIAR EL COLOR!!!!!
        return aLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(placehoderImage)
        contentView.addSubview(movieName)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            // Image constraints
            
            placehoderImage.heightAnchor.constraint(equalToConstant: 40),
            placehoderImage.widthAnchor.constraint(equalToConstant: 80),
            
            placehoderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placehoderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            placehoderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            
            movieName.leadingAnchor.constraint(equalTo: placehoderImage.trailingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
