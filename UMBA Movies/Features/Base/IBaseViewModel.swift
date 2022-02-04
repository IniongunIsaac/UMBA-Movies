//
//  IBaseViewModel.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation
import RxSwift

protocol IBaseViewModel {
    
    var isLoading: PublishSubject<LoaderConfig> { get }
    
    var alertMessage: PublishSubject<AlertMessage> { get }
    
    var isLoadingOnBottomSheet: PublishSubject<LoaderConfig> { get }
    
    var alertMessageOnBottomSheet: PublishSubject<AlertMessage> { get }
    
    var isLoadingOnDialog: PublishSubject<LoaderConfig> { get }
    
    var alertMessageOnDialog: PublishSubject<AlertMessage> { get }
    
    func didLoad()
    
    func willAppear()
    
    func didAppear()
    
    func willDisappear()
    
    func didDisappear()
    
    func showLoading(_ shouldShow: Bool, viewControllerType: ViewControllerType, loaderType: LoaderType)
    
    func showMessage(_ message: String, type: ToastType, viewControllerType: ViewControllerType)
    
    func subscribe<T>(_ observable: Observable<T>, showLoadingAnimation: Bool, viewControllerType: ViewControllerType, loaderType: LoaderType, showMessageAlerts: Bool, errorMessage: String?, success: ((T) -> Void)?, noDataHandler: NoParamHandler?, error: ErrorParamHandler?)
}
