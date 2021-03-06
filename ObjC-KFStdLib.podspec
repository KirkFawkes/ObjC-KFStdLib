Pod::Spec.new do |s|
  s.name             = 'ObjC-KFStdLib'
  s.version          = '0.1.0'
  s.summary          = 'Most used functions in iOS apps'
  s.description      = 'Additional categories and functions for debugging, logging etc'
  s.homepage         = 'https://github.com/KirkFawkes/ObjC-KFStdLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Igor Zubko' => 'igor.zubko@icloud.com' }
  s.source           = { :git => 'https://github.com/KirkFawkes/ObjC-KFStdLib.git', :tag => s.version.to_s }
  s.social_media_url = 'http://twitter.com/Kirk_Fawkes'

  s.requires_arc = true
  s.ios.deployment_target = '7.0'

  s.source_files = 'ObjC-KFStdLib/Classes/**/*.{h,m}'

  # s.public_header_files = 'Pod/Classes/**/*.h'

  # s.subspec 'Categories' do |ss|
  #   ss.source_files = 'ObjC-KFStdLib/Classes/Categories/*.{h,m}'
  # end
  #
  # s.subspec 'Utilities' do |ss|
  #   ss.source_files = 'ObjC-KFStdLib/Classes/Utilities/*.{h,m}'
  # end
end
