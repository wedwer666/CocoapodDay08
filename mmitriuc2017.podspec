#
# Be sure to run `pod lib lint mmitriuc2017.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mmitriuc2017'
  s.version          = '0.1.0'
  s.summary          = 'This is my second cocoapod done for Ecole 42 school'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is my second cocoapod done for Ecole 42 school. It was done during 2 weeks of traing in Piscine Swift
                       DESC

  s.homepage         = 'https://github.com/wedwer666/CocoapodDay08.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wedwer666' => 'mitriucmaria@gmail.com' }
  s.source           = { :git => 'https://github.com/wedwer666/CocoapodDay08.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '8.0'

  s.source_files = 'mmitriuc2017/Classes/**/*.swift'
  
  s.resource_bundles = {
     'mmitriuc2017' => ['mmitriuc2017/Classes/**/*.xcdatamodeld']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
