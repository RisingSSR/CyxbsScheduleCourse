#
# Be sure to run `pod lib lint CyxbsScheduleCourse.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = 'CyxbsScheduleCourse'
  s.version = '0.1.2'
  
  s.ios.deployment_target = '11.0'
  
  s.license = 'MIT'
  s.summary = '掌邮课表'
  s.homepage = 'https://github.com/RisingSSR/CyxbsScheduleCourse'
  s.author = { 'RisingSSR' => '2769119954@qq.com' }
  s.source = { :git => 'https://github.com/RisingSSR/CyxbsScheduleCourse.git', :tag => s.version.to_s }
  
  s.description      = <<-DESC
- Rising Schedule
    - Builder Support
    - External Transaction
    - Layout Support
    - Model Support
    - Network Support
    - Service Support
    - Tools Support
    - View Support
- Rising Schedule Custom
- Rising Schedule Detail
- Rising Schedule Event
- Rising TabBar Support
- Rising Transition
                       DESC
  
  # ---------- subspec ----------
  
  s.subspec 'HttpTool' do |ss|
    ss.source_files = 'CyxbsScheduleCourse/Classes/HttpTool/**/*'
    ss.public_header_files = 'CyxbsScheduleCourse/Classes/HttpTool/**/*.h'
    ss.dependency 'RyKit/Macro/RisingSingleClass'
    ss.dependency 'AFNetworking', '4.0.1'
  end
  
  s.subspec 'Transition' do |ss|
    ss.source_files = 'CyxbsScheduleCourse/Classes/Rising Transition/**/*'
    ss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising Transition/**/*.h'
  end
  
  s.subspec 'ShareDataSource' do |ss|
    ss.subspec 'IndexPathEX' do |sss|
        sss.source_files = 'CyxbsScheduleCourse/Classes/Rising Schedule/Model Support/NSIndexPath+Schedule/**/*'
        sss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising Schedule/Model Support/NSIndexPath+Schedule/**/*.h'
    end
    
    ss.subspec 'ScheduleCourse' do |sss|
        sss.source_files =
            'CyxbsScheduleCourse/Classes/Rising Schedule/Model Support/**/*',
            'CyxbsScheduleCourse/Classes/Rising Schedule/Model Support/Service/**/*'
        sss.public_header_files =
            'CyxbsScheduleCourse/Classes/Rising Schedule/Model Support/Public/**/*.h',
            'CyxbsScheduleCourse/Classes/Rising Schedule/Model Support/Service/**/*.h'
        sss.private_header_files = 'CyxbsScheduleCourse/Classes/Rising Schedule/Model Support/Private/**/*.h'
        sss.dependency 'RyKit/Macro/RisingSingleClass'
        sss.dependency 'CyxbsScheduleCourse/ShareDataSource/IndexPathEX'
        sss.dependency 'WCDB', '1.1.0'
    end
  end
  
  s.subspec 'ScheduleMainable' do |ss|
    ss.subspec 'Schedule' do |sss|
        sss.subspec 'CollectionViewLayout' do |ssss|
            ssss.source_files = 'CyxbsScheduleCourse/Classes/Rising Schedule/Layout Support/**/*'
            ssss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising Schedule/Layout Support/**/*.h'
            ssss.dependency 'CyxbsScheduleCourse/ShareDataSource/IndexPathEX'
        end
        
        sss.subspec 'NetworkSupport' do |ssss|
            ssss.source_files = 'CyxbsScheduleCourse/Classes/Rising Schedule/Network Support/**/*'
            ssss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising Schedule/Network Support/**/*.h'
            ssss.dependency 'CyxbsScheduleCourse/HttpTool'
            ssss.dependency 'CyxbsScheduleCourse/ShareDataSource'
        end
        
        sss.source_files =
            'CyxbsScheduleCourse/Classes/Rising Schedule/Builder Support/**/*',
            'CyxbsScheduleCourse/Classes/Rising Schedule/External Transaction/**/*',
            'CyxbsScheduleCourse/Classes/Rising Schedule/Service Support/**/*',
            'CyxbsScheduleCourse/Classes/Rising Schedule/View Support/**/*'
        sss.public_header_files =
            'CyxbsScheduleCourse/Classes/Rising Schedule/Builder Support/**/*.h',
            'CyxbsScheduleCourse/Classes/Rising Schedule/External Transaction/**/*.h',
            'CyxbsScheduleCourse/Classes/Rising Schedule/Service Support/**/*.h',
            'CyxbsScheduleCourse/Classes/Rising Schedule/View Support/**/*.h'
        sss.dependency 'CyxbsScheduleCourse/ScheduleMainable/Detail/Builder'
        sss.dependency 'CyxbsScheduleCourse/Transition'
        sss.dependency 'CyxbsScheduleCourse/ShareUI'
        sss.dependency 'CyxbsScheduleCourse/ShareDataSource/ScheduleCourse'
        sss.dependency 'CyxbsScheduleCourse/ShareDataSource/IndexPathEX'
        sss.dependency 'RyKit/Macro/RisingSingleClass'
        
        sss.dependency 'CyxbsScheduleCourse/ScheduleMainable/Custom'
        sss.dependency 'CyxbsScheduleCourse/ScheduleMainable/Detail'
        sss.dependency 'CyxbsScheduleCourse/Event'
    end
    
    ss.subspec 'Custom' do |sss|
        sss.source_files = 'CyxbsScheduleCourse/Classes/Rising Schedule Custom/**/*'
        sss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising Schedule Custom/**/*.h'
        sss.dependency 'CyxbsScheduleCourse/ShareDataSource/ScheduleCourse'
        sss.dependency 'CyxbsScheduleCourse/Transition'
        sss.dependency 'CyxbsScheduleCourse/ShareUI'
    end
    
    ss.subspec 'Detail' do |sss|
        sss.subspec 'Builder' do |ssss|
            ssss.source_files = 'CyxbsScheduleCourse/Classes/Rising Schedule Detail/Builder Support/**/*'
            ssss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising Schedule Detail/Builder Support/**/*.h'
            ssss.dependency 'CyxbsScheduleCourse/ShareUI'
            ssss.dependency 'CyxbsScheduleCourse/ShareDataSource'
            ssss.dependency 'CyxbsScheduleCourse/ScheduleMainable/Custom'
        end
        
        sss.source_files =
            'CyxbsScheduleCourse/Classes/Rising Schedule Detail/External Transaction/**/*',
            'CyxbsScheduleCourse/Classes/Rising Schedule Detail/View Support/**/*'
        sss.public_header_files =
            'CyxbsScheduleCourse/Classes/Rising Schedule Detail/External Transaction/**/*.h',
            'CyxbsScheduleCourse/Classes/Rising Schedule Detail/View Support/**/*.h'
        sss.dependency 'CyxbsScheduleCourse/Transition'
    end
  end
  
  s.subspec 'TabBar' do |ss|
    ss.source_files = 'CyxbsScheduleCourse/Classes/Rising TabBar Support/**/*'
    ss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising TabBar Support/**/*.h'
    ss.dependency 'CyxbsScheduleCourse/ScheduleMainable'
    ss.dependency 'CyxbsScheduleCourse/Transition'
    ss.dependency 'CyxbsScheduleCourse/ShareUI'
  end
  
  s.subspec 'Event' do |ss|
    ss.source_files = 'CyxbsScheduleCourse/Classes/Rising Schedule Event/**/*'
    ss.public_header_files = 'CyxbsScheduleCourse/Classes/Rising Schedule Event/**/*.h'
    ss.dependency 'CyxbsScheduleCourse/ShareDataSource'
    ss.dependency 'CyxbsScheduleCourse/ShareUI'
    ss.dependency 'hpple', '0.2.0'
  end
  
  s.subspec 'ShareUI' do |ss|
    ss.source_files = 'CyxbsScheduleCourse/Classes/ShareUI/**/*'
    ss.public_header_files = 'CyxbsScheduleCourse/Classes/ShareUI/**/*.h'
    ss.dependency 'RyKit'
    ss.dependency 'FluentDarkModeKit', '1.0.4'
  end
  
  # s.resource_bundles = {
  #   'CyxbsScheduleCourse' => ['CyxbsScheduleCourse/Assets/*.png']
  # }

end
