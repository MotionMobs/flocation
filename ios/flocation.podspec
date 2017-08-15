#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flocation'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project for location access.'
  s.description      = <<-DESC
A new flutter plugin project for location access.
                       DESC
  s.homepage         = 'https://github.com/MotionMobs/flocation'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'MotionMobs' => 'matt@motionmobs.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  
  s.ios.deployment_target = '8.0'
end

