source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
#inhibit_all_warnings!

#project 'WeexClient/WeexClient.xcodeproj'

project 'WeexFrameworks/WeexFrameworks.xcodeproj'


def common
    pod 'WeexSDK', :path=>'../sdk/'
    pod 'WXDevtool', '0.8.2'
    pod 'SDWebImage', '3.7.5'
    pod 'SocketRocket', '0.4.2'
    pod 'ATSDK-Weex', '0.0.1'
    pod 'AFNetworking', '~> 3.0'

end

#target 'WeexClient' do
#    common
#end

#target 'WeexClientUITests' do
#    common
#end

target 'WeexFrameworks' do
    common
end
