//
//  File.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit

class ACButton: UIButton {
    
    var tapAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String? = nil, attributedTitle: NSAttributedString? = nil, font: UIFont = .avenirExtraBold(size: 15), backgroundColor: UIColor = .primaryYellow, textColor: UIColor = .primaryTextColor, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil, cornerRadius: CGFloat = 5, height: CGFloat? = nil, width: CGFloat? = nil, size: CGFloat? = nil, image: UIImage? = nil, tintColor: UIColor? = nil, tapAction: (() -> Void)? = nil) {
        self.init(type: .system)
        self.backgroundColor = backgroundColor
        viewCornerRadius = cornerRadius
        self.title = title
        self.textColor = textColor
        clipsToBounds = true
        self.font = font
        
        if let attributedTitle = attributedTitle {
            self.attributedTitle = attributedTitle
        }
        
        if let image = image {
            setImage(image, for: .normal)
        }
        
        if let tintColor = tintColor {
            self.tintColor = tintColor
        }
        
        if let borderColor = borderColor {
            self.borderColor = borderColor
        }
        
        if let borderWidth = borderWidth {
            viewBorderWidth = borderWidth
        }
        
        if let height = height {
            constraintHeight(constant: height)
        }
        
        if let width = width {
            constraintWidth(constant: width)
        }
        
        if let size = size {
            constraintSize(constant: size)
        }
        
        self.tapAction = tapAction
        
        addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc fileprivate func handleButtonTap() {
        tapAction?()
    }
    
    override public var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = .primaryYellow
            } else {
                backgroundColor = UIColor.primaryYellow.withAlphaComponent(0.5)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
