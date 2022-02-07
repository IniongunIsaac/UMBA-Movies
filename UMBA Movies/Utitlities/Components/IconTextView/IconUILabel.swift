//
//  IconUILabel.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import UIKit

class IconUILabel: UILabel {

    convenience init(text: String, font: UIFont = .avenirRegular(15), icon: UIImage, position: IconPosition = .left, iconSize: Double = 18, iconPadding: Int = 3, textColor: UIColor = .aLabel, alignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        
        let textAttrs = NSMutableAttributedString()
        
        let imageAttachment = NSTextAttachment().apply {
            $0.image = icon
            $0.bounds = CGRect(x: 0, y: -5, width: iconSize, height: iconSize)
        }
        
        var padding = ""
        (0..<iconPadding).forEach { _ in padding.append(" ") }
        
        let textAttributes: [NSAttributedString.Key : Any] = [
            .font: font,
            .foregroundColor: textColor
        ]
        
        switch position {
        case .left:
            textAttrs.do {
                $0.append(imageAttachment.attributedString)
                $0.append(NSAttributedString(string: "\(padding)\(text)", attributes: textAttributes))
            }
        case .right:
            textAttrs.do {
                $0.append(NSAttributedString(string: "\(text)\(padding)", attributes: textAttributes))
                $0.append(imageAttachment.attributedString)
            }
        }
        textAlignment = alignment
        attributedText = textAttrs
    }

}

extension NSTextAttachment {
    var attributedString: NSAttributedString {
        NSAttributedString(attachment: self)
    }
}
