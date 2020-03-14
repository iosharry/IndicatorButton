#
# Be sure to run `pod lib lint IndicatorButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name           		  = 'IndicatorButton'
  s.version        		  = '0.1.1'
  s.summary        		  = 'Easily manage state values with UIButton with UIActivityIndicatorView (UIButtons include simple animation)'
  s.homepage       		  = 'https://github.com/gwangyonglee/IndicatorButton'
  s.license        		  = { :type => 'MIT', :file => 'LICENSE' }
  s.author         		  = { 'gwangyonglee' => 'gwangyonglee92@gmail.com' }
  s.source         		  = { :git => 'https://github.com/gwangyonglee/IndicatorButton.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files 		  = 'IndicatorButton/Classes/**/*'
  s.swift_version         = '5.0'
end
