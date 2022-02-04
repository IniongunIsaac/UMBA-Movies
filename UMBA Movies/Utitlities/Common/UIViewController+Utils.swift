//
//  UIViewController+Utils.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import Foundation
import UIKit
import PopupDialog
import Toast_Swift

extension UIViewController {
    
    func configureNavBar(title: String, barBgColor: UIColor = .primaryYellow, font: UIFont = .avenirBold(size: 15), barTextColor: UIColor = .primaryTextColor, prefersLargeTitle: Bool = false) {
        self.title = title
        navigationController?.navigationBar.apply {
            $0.prefersLargeTitles = prefersLargeTitle
            $0.barTintColor = barBgColor
            $0.titleTextAttributes = [.foregroundColor: barTextColor, .font: font]
            $0.largeTitleTextAttributes = [.foregroundColor: barTextColor, .font: font]
            $0.tintColor = barTextColor
        }
    }
    
    func configureNavBar(centerImage: UIImage? = nil, barTintColor: UIColor = .primaryYellow, tintColor: UIColor = UIColor("#31355B"), height: CGFloat? = nil, width: CGFloat? = nil) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.do {
            $0.barTintColor = barTintColor
            $0.shadowImage = UIImage()
            $0.layoutIfNeeded()
        }
        navigationItem.titleView = UIImageView(image: centerImage, height: height, width: width)
        navigationController?.navigationBar.do {
            $0.tintColor = tintColor
            $0.layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.09).cgColor
            $0.layer.shadowOffset = CGSize(width: 0.0, height: 5)
            $0.layer.shadowRadius = 5.0
            $0.layer.shadowOpacity = 0.5
            $0.layer.masksToBounds = false
        }
    }
    
    func enableSwipeBackToPopGesture(_ enable: Bool = true) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = enable
    }
    
    func showNavigationBarButton(_ status: Bool) {
        if !status {
            navigationItem.rightBarButtonItem?.customView?.alpha = 0.5
            navigationItem.rightBarButtonItem?.isEnabled = false
        } else {
            navigationItem.rightBarButtonItem?.customView?.alpha = 1
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
    
    var _width: CGFloat { UIScreen.main.bounds.width }
    
    var _height: CGFloat { UIScreen.main.bounds.height }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addSubview(_ view: UIView) {
        self.view.addSubview(view)
    }
    
    var topAnchor: NSLayoutYAxisAnchor? { view.topAnchor }
    
    var bottomAnchor: NSLayoutYAxisAnchor? { view.bottomAnchor }
    
    var leadingAnchor: NSLayoutXAxisAnchor? { view.leadingAnchor }
    
    var trailingAnchor: NSLayoutXAxisAnchor? { view.trailingAnchor }
    
    var safeAreaTopAnchor: NSLayoutYAxisAnchor? { view.safeAreaLayoutGuide.topAnchor }
    
    var safeAreaBottomAnchor: NSLayoutYAxisAnchor? { view.safeAreaLayoutGuide.bottomAnchor }
    
    var safeAreaLeadingAnchor: NSLayoutXAxisAnchor? { view.safeAreaLayoutGuide.leadingAnchor }
    
    var safeAreaTrailingAnchor: NSLayoutXAxisAnchor? { view.safeAreaLayoutGuide.trailingAnchor }
    
    var backgroundColor: UIColor? {
        get { view.backgroundColor }
        set { view.backgroundColor = newValue }
    }
    
    func showNavBar(_ show: Bool = true) {
        navigationController?.navigationBar.isHidden = !show
        navigationController?.setNavigationBarHidden(!show, animated: true)
        navigationController?.isNavigationBarHidden = !show
    }
    
    func setBackButtonText(_ text: String = "") {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: text, style: .plain, target: nil, action: nil)
    }
    
    func showBackButton(_ show: Bool = true) {
        navigationItem.setHidesBackButton(!show, animated: true)
    }
    
    func showTabBar(_ show: Bool = true) {
        tabBarController?.tabBar.isHidden = !show
    }
    
    func _popViewController(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func _popToRootViewController(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func _pushViewController(_ viewcontroller: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewcontroller, animated: animated)
    }
    
    func dismissViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = navigationController?.viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            navigationController?.popToViewController(vc, animated: animated)
       }
    }
    
    func setViewControllers(using viewController: UIViewController, animate: Bool = false) {
        navigationController?.setViewControllers([viewController], animated: animate)
    }
    
    func showMessage(_ message: String, type: ToastType = .success) {
        Toast.shared.show(message, type: type)
    }
    
    func showAlert(message: String, type: ToastType, position: ToastPosition = .top, duration: TimeInterval = 3.0, dismissCompletion: (() -> Void)? = nil) {
        hideAlert()
        var color: UIColor = .appGreen
        switch type {
        case .error:
            color = .systemRed
        case .success:
            color = .appGreen
        }
        
        var toastStyle = ToastStyle()
        toastStyle.messageColor = .white
        toastStyle.messageFont = .avenirRegular(size: 14)
        toastStyle.backgroundColor = color
        
        ToastManager.shared.isTapToDismissEnabled = true
        
        runOnMainThread { [weak self] in
            self?.view.makeToast(message, duration: duration, position: position, style: toastStyle)
        }
    }
    
    func hideAlert() {
        runOnMainThread { [weak self] in
            self?.view.hideAllToasts()
        }
    }
    
    func showDialog(for viewController: UIViewController, opacity: CGFloat = 0.1, tapToDismiss: Bool = true, dismissCompletionHandler: (() -> Void)? = nil) {
        let containerAppearance = PopupDialogContainerView.appearance()
        containerAppearance.cornerRadius = Float(10)
        
        let overlayAppearance = PopupDialogOverlayView.appearance()
        overlayAppearance.opacity = opacity
        
        let popupDialog = PopupDialog(viewController: viewController, transitionStyle: .bounceUp, tapGestureDismissal: tapToDismiss, panGestureDismissal: tapToDismiss, completion: dismissCompletionHandler)
        present(popupDialog, animated: true, completion: nil)
    }
    
}
