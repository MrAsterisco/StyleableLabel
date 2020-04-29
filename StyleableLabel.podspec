#
# Be sure to run `pod lib lint StyleableLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StyleableLabel'
  s.version          = '1.0.0'
  s.summary          = 'A UILabel subclass that supports directional content insets and simplifies styling.'

  s.description      = <<-DESC
A simple UILabel subclass that supports setting directional content insets to add
padding around the text, as well as exposing the CALayer corner radius property directly.
                       DESC

  s.homepage         = 'https://github.com/mrasterisco/StyleableLabel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mrasterisco' => 'a.moiso@pillohealth.com' }
  s.source           = { :git => 'https://github.com/mrasterisco/StyleableLabel.git', :tag => s.version.to_s }

  s.swift_version = '5.1'
  s.platform = :ios
  s.ios.deployment_target = '9.0'

  s.source_files = 'StyleableLabel/Classes/**/*'
  
end
