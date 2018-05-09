#
# Be sure to run `pod lib lint StaticMapRequestBuilder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StaticMapRequestBuilder'
  s.version          = '1.0.0'
  s.summary          = 'A lightweight helper to create request URLs for the Google Maps Static API'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simply creates a URL to request a map image from Google Maps Static API. Replaces the need for error-prone hard coding of URL strings by providing type-safe methods to create and add parameters to the URL.
                       DESC

  s.homepage         = 'https://github.com/killianke/StaticMapRequestBuilder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Killian Kenny' => 'killiankenny21@gmail.com' }
  s.source           = { :git => 'https://github.com/killianke/StaticMapRequestBuilder.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'

  s.source_files = 'StaticMapRequestBuilder/Classes/**/*'

  s.frameworks = 'CoreLocation'

end
