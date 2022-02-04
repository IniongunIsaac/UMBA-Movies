//
//  Loader.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit
import Lottie

enum LoaderType {
    case horizontalLine, fullScreen
}

struct LoaderConfig {
    let show: Bool
    let type: LoaderType
}

class Loader: UIView {
    
    static var shared = Loader()
    var animation: AnimationView!
    
    var blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        insertSubview(blurView, at: 0)
        blurView.fillSuperview()
        animation = AnimationView(name: "loader-file")
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animation)
        animation.centerInSuperview(size: .init(width: 300, height: 250))
    }
    
    func showLoader() {
        animation.play()
        let window = UIApplication.shared.keyWindow!
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tag = 91202
        window.addSubview(self)
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            self.heightAnchor.constraint(equalTo: window.heightAnchor),
            self.widthAnchor.constraint(equalTo: window.widthAnchor)
        ])
    }
    
    func hideLoader() {
        let view = viewWithTag(91202)
        view?.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
