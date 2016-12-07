source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def pods
    pod 'Alamofire'
    pod 'Kingfisher'
    pod 'RealmSwift'
    pod 'Firebase/Core'
    pod 'Firebase/AdMob'
    pod 'SnapKit'
    pod 'ImagePicker'
end

target 'Beauty' do
    pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
