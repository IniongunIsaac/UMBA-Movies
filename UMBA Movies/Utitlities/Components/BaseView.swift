//
//  BaseView.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit
import RxSwift

open class BaseView: UIView {
    
    let disposeBag = DisposeBag()

    open func setup() {
        backgroundColor = .aSystemBackground
    }
    
    open func layout() {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
