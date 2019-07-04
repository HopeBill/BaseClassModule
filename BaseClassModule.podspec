Pod::Spec.new do |s|
s.name             = 'BaseClassModule'
s.version          = '0.1.1'
s.summary          = 'tabbar'

s.description      = 'tabbar'

s.homepage         = 'https://github.com/LiBiYong/BaseClassModule'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { '1255418023@qq.com' => '1255418023@qq.com' }
s.source           = { :git => 'https://github.com/LiBiYong/BaseClassModule.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'

s.source_files = 'BaseClassModule/**/*'

#  s.resource_bundle= {
#     'AsstesImageBundle' => ['BaseClassModule/*.png']
#  }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit'
s.dependency 'ResourceUtilityClass'
end


