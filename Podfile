platform :ios, '18.0'

target '4.8' do
  use_frameworks!

  pod 'GoogleMaps', '~> 9.3.0'
  pod 'GooglePlaces', '~> 9.3.0'
end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '18.0'
    end
  end
end