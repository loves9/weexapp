source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
#inhibit_all_warnings!

project 'WeexClient/WeexClient.xcodeproj'

#xcodeproj 'WeexLibrary/WeexLibrary.xcodeproj'


def common
    pod 'WeexSDK', :path=>'../sdk/'
    pod 'WXDevtool', '0.8.2'
    pod 'SDWebImage', '3.7.5'
    pod 'SocketRocket', '0.4.2'
    pod 'ATSDK-Weex', '0.0.1'
end

target 'WeexClient' do
    common
end

target 'WeexClientUITests' do
    common
end

#target 'WeexLibrary' do
#    common
#end
