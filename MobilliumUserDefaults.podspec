Pod::Spec.new do |s|
    s.name             = 'MobilliumUserDefaults'
    s.version          = '2.0.0'
    s.summary          = 'UserDefaults helper for iOS apps.'
    
    s.homepage         = 'https://github.com/mobillium/MobilliumUserDefaults'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'mobillium' => 'info@mobillium.com' }
    s.source           = { :git => 'https://github.com/mobillium/MobilliumUserDefaults.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '9.0'
    s.swift_version = '5.0'
    
    s.source_files = 'MobilliumUserDefaults/Classes/**/*'
end
