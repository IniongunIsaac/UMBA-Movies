//
//  DeviceManager.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import Foundation
import DeviceKit

enum DeviceScreenSize {
    case small, normal, large
}

struct DeviceManager {
    static let shared = DeviceManager()
    fileprivate init(){}
    
    var screenSize: DeviceScreenSize {
        switch Device.current {
        case .iPhone4, .iPhone4s, .iPhone5, .iPhone5c, .iPhone5s, .iPhone6, .iPhone6s, .iPhoneSE, .iPhone6Plus, .iPhone6sPlus, .iPhone7, .iPhone8, .iPhoneX, .iPhone12Mini, .iPhone13Mini, .iPhoneSE2, .iPodTouch5, .iPodTouch6, .iPodTouch7, .homePod:
            return .small
        case .iPhone7Plus, .iPhone8Plus, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhone12, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Pro, .iPhone13ProMax:
            return .normal
        case .iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPad7, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3, .iPad8, .iPad9, .iPadAir4, .iPadMini6, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5:
            return .normal
        case .simulator(_):
            return .normal
        case .unknown(_):
            return .normal
        }
    }
}
