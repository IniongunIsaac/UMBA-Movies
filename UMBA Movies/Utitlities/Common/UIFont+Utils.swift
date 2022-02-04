//
//  UIFont+Utils.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit

extension UIFont {
    class func avenirExtraBold(size: CGFloat = 14) -> UIFont { UIFont(name: "Avenir-Black", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    class func avenirBold(size: CGFloat = 14) -> UIFont { UIFont(name: "Avenir-Heavy", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    class func avenirRegular(size: CGFloat = 14) -> UIFont { UIFont(name: "Avenir-Roman", size: size) ?? UIFont.systemFont(ofSize: size) }
}
