//
//  MovieCollectionViewCell.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 07/02/2022.
//

import UIKit

class MovieCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate let posterImageView = UIImageView(image: R.image.poster_placeholder(), contentMode: .scaleAspectFill)
    fileprivate let movieNameLabel = UILabel(text: "", font: .avenirBold(15), alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let votesIconTextView = IconTextView(text: "1000", font: .avenirBold(14), placeholderIcon: R.image.thumbs_up_icon(), iconTint: .primaryColor, iconTextAlignment: .iconLeft, iconSize: 26, numberOfLines: 1, textAlignment: .left, contentStackAlignment: .center, contentSpacing: 0)
    fileprivate let dateLabel = UILabel(text: "2000", font: .avenirExtraBold(15), color: .primaryColor, alignment: .right)
    fileprivate let containerView = UIView(backgroundColor: .aSystemBackground)
    
    override func setup() {
        super.setup()
        addClearBackground()
        containerView.do {
            _addSubview($0)
            $0.fillSuperview()
            $0.addSubviews(posterImageView, movieNameLabel, votesIconTextView, dateLabel)
            votesIconTextView.anchor(leading: $0.leadingAnchor, bottom: $0.bottomAnchor, padding: ._init(left: 4, bottom: 10))
            dateLabel.anchor(trailing: $0.trailingAnchor, padding: ._init(right: 8))
            dateLabel.centerYAnchor.constraint(equalTo: votesIconTextView.centerYAnchor).isActive = true
            movieNameLabel.anchor(leading: $0.leadingAnchor, bottom: votesIconTextView.topAnchor, trailing: $0.trailingAnchor, padding: ._init(left: 8, bottom: 10, right: 8))
            posterImageView.anchor(top: $0.topAnchor, leading: $0.leadingAnchor, bottom: movieNameLabel.topAnchor, trailing: $0.trailingAnchor, padding: ._init(bottom: 20))
            $0.viewCornerRadius = 5
            $0.viewBorderWidth = 0.7
            $0.borderColor = .aSystemFill
        }
        
    }
    
    func configure(_ movie: Movie) {
        movie.do {
            if $0.posterPath.isNotNil {
                posterImageView.setImageFromURL(url: $0.posterURL, placeholderImage: R.image.poster_placeholder())
            }
            movieNameLabel.text = $0.title
            votesIconTextView.text = $0.voteCount?.string
            dateLabel.text = $0.releaseDate?.components(separatedBy: "-")[0]
        }
    }
}
