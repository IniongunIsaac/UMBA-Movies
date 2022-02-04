//
//  IconTextView.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import UIKit

enum IconTextAlignment {
    case iconRight, iconLeft, iconTop, iconBottom
}

class IconTextView: BaseView {
    
    fileprivate let textLabel = UILabel()
    fileprivate let iconImageView = UIImageView()

    convenience init(text: String = "", font: UIFont = .avenirRegular(size: 15), placeholderIcon: UIImage? = nil, iconURL: String? = nil, iconTextAlignment: IconTextAlignment = .iconLeft, iconSize: CGFloat = 18, textColor: UIColor = .aLabel, numberOfLines: Int = 0, textAlignment: NSTextAlignment = .left, contentStackDistribution: UIStackView.Distribution = .fill, contentStackAlignment: UIStackView.Alignment = .fill, contentSpacing: CGFloat = 8) {
        self.init(frame: .zero)
        
        textLabel.apply {
            $0.text = text
            $0.font = font
            $0.numberOfLines = numberOfLines
            $0.textColor = textColor
            $0.textAlignment = textAlignment
        }
        
        iconImageView.apply {
            $0.constraintSize(constant: iconSize)
            $0.image = placeholderIcon
        }
        
        var contentStackView: UIStackView
        
        switch iconTextAlignment {
        case .iconRight:
            contentStackView = HorizontalStackView(arrangedSubviews: [textLabel, iconImageView], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        case .iconLeft:
            contentStackView = HorizontalStackView(arrangedSubviews: [iconImageView, textLabel], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        case .iconTop:
            contentStackView = VerticalStackView(arrangedSubviews: [iconImageView, textLabel], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        case .iconBottom:
            contentStackView = VerticalStackView(arrangedSubviews: [textLabel, iconImageView], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        }
        
        addSubview(contentStackView)
        contentStackView.fillSuperview()
        
        if let iconURL = iconURL {
            iconImageView.setImageFromURL(url: iconURL, placeholderImage: placeholderIcon)
        }
    }
    
    convenience init(attributedText: NSAttributedString, placeholderIcon: UIImage? = nil, iconURL: String? = nil, iconTextAlignment: IconTextAlignment = .iconLeft, iconSize: CGFloat = 18, numberOfLines: Int = 0, textAlignment: NSTextAlignment = .left, contentStackDistribution: UIStackView.Distribution = .fill, contentStackAlignment: UIStackView.Alignment = .fill, contentSpacing: CGFloat = 8) {
        self.init(frame: .zero)
        
        textLabel.apply {
            $0.attributedText = attributedText
            $0.numberOfLines = numberOfLines
            $0.textAlignment = textAlignment
        }
        
        iconImageView.apply {
            $0.constraintSize(constant: iconSize)
            $0.image = placeholderIcon
        }
        
        var contentStackView: UIStackView
        
        switch iconTextAlignment {
        case .iconRight:
            contentStackView = HorizontalStackView(arrangedSubviews: [textLabel, iconImageView], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        case .iconLeft:
            contentStackView = HorizontalStackView(arrangedSubviews: [iconImageView, textLabel], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        case .iconTop:
            contentStackView = VerticalStackView(arrangedSubviews: [iconImageView, textLabel], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        case .iconBottom:
            contentStackView = VerticalStackView(arrangedSubviews: [textLabel, iconImageView], spacing: contentSpacing, distribution: contentStackDistribution, alignment: contentStackAlignment)
        }
        
        addSubview(contentStackView)
        contentStackView.fillSuperview()
        
        if let iconURL = iconURL {
            iconImageView.setImageFromURL(url: iconURL, placeholderImage: placeholderIcon)
        }
    }
    
    var text: String? {
        get { textLabel.text }
        set { textLabel.text = newValue }
    }
    
    var textColor: UIColor? {
        get { textLabel.textColor }
        set { textLabel.textColor = newValue }
    }
    
    var iconImageURL: String? {
        didSet {
            iconImageURL?.do {
                iconImageView.setImageFromURL(url: $0, placeholderImage: iconImageView.image)
            }
        }
    }

}
