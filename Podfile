# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

def networkAndRxPods
  pod 'RxAlamofire', '~> 5'
  pod 'RxSwift', '5.1.1'
  pod 'RxCocoa', '5.1.1'
end

def utilityPods
  pod 'RealmSwift', '~>10'
  pod 'SwiftyStarRatingView', '~> 1.0'
  pod 'lottie-ios', '3.1.1'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'R.swift'
  pod 'BottomPopup'
  #Rx Datasources for TableViews and UICollectionViews
  pod 'RxDataSources', '~> 4.0'
  pod 'RangeSeekSlider'
  pod 'SVPinView', '~> 1.0'
  pod "AttributedStringBuilder"
  pod 'PopupDialog'
  pod 'MarqueeLabel'
  pod 'SDWebImage', '~> 5.0'
  pod 'SDWebImageSVGKitPlugin'
  pod "WARangeSlider"
  pod 'IQKeyboardManagerSwift'
  pod 'FittedSheets'
  pod 'Cosmos', '~> 21.0'
  pod 'DropDown'
  pod 'HorizontalProgressBar'
  pod 'DeviceKit', '~> 4.0'
  pod 'Toast-Swift', '~> 5.0.1'
  pod 'Swinject'
end

target 'UMBA Movies' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Autocheck Partner
  networkAndRxPods
  utilityPods

  target 'UMBA MoviesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'UMBA MoviesUITests' do
    # Pods for testing
  end

end
