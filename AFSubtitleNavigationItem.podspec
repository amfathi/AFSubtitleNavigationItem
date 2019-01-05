#
# Be sure to run `pod lib lint AFSubtitleNavigationItem.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AFSubtitleNavigationItem'
  s.version          = '0.1.0'
  s.summary          = 'Create custom title and subtitle labels in your native navigation item.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Extending the native navigationItem capabilities to instantly add custom title and subtitle labels.
The labels are fully customizable and works very well with the bar button items.
                       DESC

  s.homepage         = 'https://github.com/AhmedFathi680/AFSubtitleNavigationItem'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmed Fathi' => 'AhmedFathi680@gmail.com' }
  s.source           = { :git => 'https://github.com/ahmedfathi680/AFSubtitleNavigationItem.git', :tag => s.version.to_s }
  # s.social_media_url = 'www.linkedin.com/in/ahmedfathisayed'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source_files = 'AFSubtitleNavigationItem/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AFSubtitleNavigationItem' => ['AFSubtitleNavigationItem/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
