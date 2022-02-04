//
//  PreferenceImpl.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation

struct PreferenceImpl: IPreference {
    
    @UserDefaultPrimitive(key: PreferenceConstants.HAS_ONBOARDED, default: false)
    var hasOnboarded: Bool
    
}
