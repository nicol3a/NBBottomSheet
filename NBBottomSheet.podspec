Pod::Spec.new do |spec|
  spec.name             = 'NBBottomSheet'
  spec.version          = '1.0.1'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/nicol3a/NBBottomSheet'
  spec.authors          = { 'Nicolas Bichon' => 'bichon.nicolas@gmail.com' }
  spec.summary          = 'An iOS library that presents a bottom sheet using Auto Layout.'
  spec.source           = { :git => 'https://github.com/nicol3a/NBBottomSheet.git', :tag => spec.version }
  spec.source_files     = 'NBBottomSheet/NBBottomSheet/Sources/**/*.{h,m,swift}'
  spec.framework        = 'Foundation', 'UIKit'
  spec.platform         = :ios, '9.0'
  spec.requires_arc     = true
  spec.swift_version    = '4.2'
end
