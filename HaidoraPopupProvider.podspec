Pod::Spec.new do |s|
    s.name             = 'HaidoraPopupProvider'
    s.version          = '0.1.0'
    s.summary          = 'A wrapper for Popup.'
    s.description      = <<-DESC
    A wrapper for progress hud.
    DESC
    
    s.homepage         = 'https://github.com/Haidora/HaidoraPopupProvider.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'mrdaios' => 'mrdaios@gmail.com' }
    s.source           = { :git => 'https://github.com/Haidora/HaidoraPopupProvider.git', :tag => s.version.to_s }
    s.ios.deployment_target = '8.0'
    
    s.subspec 'Core' do |core|
        core.source_files = 'HaidoraPopupProvider/*'
    end
    s.subspec 'MMPopupView' do |mMPopupView|
        mMPopupView.source_files = 'HaidoraPopupProvider/MMPopupView/**/*'
        mMPopupView.dependency 'HaidoraPopupProvider/Core'
        mMPopupView.dependency 'MMPopupView', '~> 1.7.2'
    end
    
    s.default_subspec = 'Core'
end
