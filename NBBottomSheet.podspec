Pod::Spec.new do |spec|
  spec.name                  = 'NBBottomSheet'
  spec.version               = '1.2.0'
  spec.license               = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage              = 'https://github.com/nicol3a/NBBottomSheet'
  spec.authors               = { 'Nicolas Bichon' => 'bichon.nicolas@gmail.com' }
  spec.social_media_url      = "http://twitter.com/nicol3a"
  spec.summary               = 'An iOS library that presents a bottom sheet using Auto Layout.'
  spec.source                = { :git => 'https://github.com/nicol3a/NBBottomSheet.git', :tag => spec.version.to_s }
  spec.source_files          = 'NBBottomSheet/NBBottomSheet/Sources/**/*.{h,m,swift}'
  spec.framework             = 'Foundation', 'UIKit'
  spec.platform              = :ios
  spec.ios.deployment_target = '9.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.0'
end
