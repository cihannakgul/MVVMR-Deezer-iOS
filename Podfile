# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace "DeezerMVVMRouter"
target 'DeezerMVVMRouter' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DeezerMVVMRouter

  # Helper
   pod 'SwiftLint', '~> 0.49'
   pod 'Kingfisher', '~> 7.4'
   
   # UI
   pod 'lottie-ios'
   pod 'SwiftEntryKit', '2.0.0'
   pod 'TinyConstraints', '~> 4.0'
   
   # Network
   pod 'Alamofire', '~> 5.6'
   


end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  
  # Network
  pod 'Alamofire', '~> 5.6'

end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  
  # Helper
  pod 'SwiftGen', '~> 6.6'
  pod 'Kingfisher', '~> 7.4'
  
  # UI
  pod 'lottie-ios'
  pod 'TinyConstraints', '~> 4.0'

end