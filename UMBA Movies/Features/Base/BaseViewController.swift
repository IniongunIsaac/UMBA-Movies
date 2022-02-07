//
//  BaseViewController.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit
import RxSwift
import RxCocoa
import HorizontalProgressBar
import DeviceKit

class BaseViewController<VW: UIView, VM: Any>: UIViewController {
    
    let kview: VW
    fileprivate let baseViewModel: BaseViewModel
    let viewModel: VM
    let disposeBag = DisposeBag()
    var progressBar: HorizontalProgressbar?
    var preference: IPreference
    
    var horizontalProgressBarYPosition: CGFloat {
        navigationController?.navigationBar.frame.maxY ?? (Device.current.isOneOf(Device.allDevicesWithSensorHousing + Device.allSimulatorDevicesWithSensorHousing) ? 88 : 64)
    }
    
    var progressBarColor: UIColor { .primaryColor }
    
    init(viewModel: VM, preference: IPreference = PreferenceImpl()) {
        self.baseViewModel = viewModel as! BaseViewModel
        self.viewModel = viewModel
        kview = VW(frame: .zero)
        self.preference = preference
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor = .aSystemBackground
        addSubview(kview)
        addSubviewConstraints()
        setObservers()
        baseViewModel.didLoad()
        configureViews()
    }
    
    func addSubviewConstraints() {
        kview.anchor(top: safeAreaTopAnchor, leading: safeAreaLeadingAnchor, bottom: safeAreaBottomAnchor, trailing: safeAreaTrailingAnchor)
    }
    
    func configureViews() {}
    
    fileprivate func createHorizontalProgressBar() {
        progressBar = HorizontalProgressbar(frame: CGRect(x: 0, y: horizontalProgressBarYPosition, width: view.frame.width, height: 4))
        view.addSubview(progressBar!)
        progressBar?.noOfChunks = 1  // You can provide number of Chunks/Strips appearing over the animation. By default it is 3
        progressBar?.kChunkWdith = Double(view.frame.width) - 20 // Adjust the width of Chunks/Strips
        progressBar?.progressTintColor = progressBarColor  // To change the Chunks color
        progressBar?.trackTintColor = UIColor.darkGray  // To change background color of loading indicator
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
    fileprivate func setObservers() {
        observeLoadingState()
        observeAlertMessages()
        setChildViewControllerObservers()
    }
    
    func setChildViewControllerObservers() {}
    
    fileprivate func observeAlertMessages() {
        baseViewModel.alertMessage.bind { [weak self] value in
            self?.showAlert(message: value.message, type: value.type)
        }.disposed(by: disposeBag)
    }
    
    private func observeLoadingState() {
        baseViewModel.isLoading.bind { [weak self] config in
            if config.show {
                self?.showLoading(type: config.type)
            } else {
                self?.hideLoading(type: config.type)
            }
        }.disposed(by: disposeBag)
    }
    
    func showLoading(type: LoaderType = .fullScreen) {
        hideLoading()
        switch type {
        case .horizontalLine:
            createHorizontalProgressBar()
            progressBar?.startAnimating()
        case .fullScreen:
            Loader.shared.showLoader()
        }
        view.enableUserInteraction(false)
    }
    
    func hideLoading(type: LoaderType = .fullScreen) {
        switch type {
        case .horizontalLine:
            progressBar?.stopAnimating()
        case .fullScreen:
            Loader.shared.hideLoader()
        }
        view.enableUserInteraction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideAlert()
        hideKeyboard()
        baseViewModel.willAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideAlert()
        hideKeyboard()
        baseViewModel.willDisappear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        baseViewModel.didAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        baseViewModel.didDisappear()
    }
    
}
