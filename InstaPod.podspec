#
# Be sure to run `pod lib lint InstaPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InstaPod'
  s.version          = '0.1.0'
  s.swift_version    = '4.0'
  s.summary          = 'Instapod for connecting to my custom backend service.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Instapod for connecting to my custom backend service in Node.js'

  s.homepage         = 'https://github.com/SandeshOnRails/instapod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sandesh Basnet' => 'sbasnet@mail.sfsu.edu' }
  s.source           = { :git => 'https://github.com/SandeshOnRails/instapod.git', :tag => '0.1.0', :commit => "c640c46431ec15f09d4419ae3f83c49255695919" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NoParse.swift'
  
  # s.resource_bundles = {
  #   'InstaPod' => ['InstaPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
