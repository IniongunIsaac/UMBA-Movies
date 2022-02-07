//
//  MovieDetailsView.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import UIKit
import AttributedStringBuilder

class MovieDetailsView: BaseScrollView {
    
    var popHandler: NoParamHandler?

    fileprivate let backIconContainer = UIView(size: 50, backgroundColor: .aSecondarySystemBackground)
    fileprivate let backIconImageView = UIImageView(image: R.image.left_angle_icon(), tintColor: .aLabel, size: 35)
    fileprivate let posterImageView = UIImageView(image: R.image.poster_placeholder(), contentMode: .scaleAspectFill)
    fileprivate let detailsLabel = UILabel(text: "", numberOfLines: 0, adjustsFontSizeToFitWidth: false)
    
    override func setup() {
        super.setup()
        _addSubviews(posterImageView, detailsLabel, backIconContainer)
        backIconContainer.do {
            $0.addSubview(backIconImageView)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, padding: ._init(top: 20, left: 20))
            $0.viewCornerRadius = 25
            $0.animateViewOnTapGesture(completion: handleBackContainerTapped)
            
        }
        backIconImageView.centerInSuperview()
        posterImageView.do {
            $0.constraintHeight(constant: UIScreen.main.bounds.height / 3.5)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor)
        }
        detailsLabel.anchor(top: posterImageView.bottomAnchor, leading: _leadingAnchor, bottom: _bottomAnchor, trailing: _trailingAnchor, padding: ._init(top: 210, left: 20, bottom: 20, right: 20))
    }
    
    func showDetails(_ movieDetail: MovieDetail) {
        movieDetail.do {
            if $0.posterPath.isNotNil || $0.backdropPath.isNotNil {
                posterImageView.setImageFromURL(url: $0.posterURL, placeholderImage: R.image.poster_placeholder())
            }
            let fontSize = 15.cgfloat
            let details = AttributedStringBuilder()
                .text($0.title!, attributes: [.font(.avenirExtraBold(25)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Genres: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.genres?.compactMap { $0.name }.joined(separator: ", ") ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Tagline: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.tagline ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Overview: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.overview ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Budget: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.budget?.currencyFormatted(symbol: "$", decimalPlaces: 2) ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Revenue: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.revenue?.currencyFormatted(symbol: "$", decimalPlaces: 2) ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Production Companies: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.productionCompanies?.compactMap { $0.name }.joined(separator: ", ") ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Runtime: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.runtime?.string ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Spoken Languages: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.spokenLanguages?.compactMap { $0.name }.joined(separator: ", ") ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Release Date: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.releaseDate ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Vote Average: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.voteAverage?.string ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .text("Vote Count: ", attributes: [.font(.avenirBold(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .text($0.voteCount?.string ?? "N/A", attributes: [.font(.avenirRegular(fontSize)), .textColor(.aLabel), .alignment(.left)])
                .newlines(2)
                .attributedString
            
            detailsLabel.attributedText = details
        }
    }
    
    fileprivate func handleBackContainerTapped() {
        popHandler?()
    }

}
