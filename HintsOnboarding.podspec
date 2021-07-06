Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "HintsOnboarding"
  spec.version      = "0.0.5"
  spec.summary      = "Hints Onboarding para indicar as novidades para seu usuário"
  spec.description  = "Hints de Onboarding é uma boa forma de exibir o que há de novo para seu usuário de uma fomra simple e bonita."
  spec.homepage     = "http://carloshperc.me"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Carlos Henrique" => "carloshenrique.pdoc@gmail.com" }
  spec.social_media_url   = "https://twitter.com/carloshperc"

  spec.platform     = :ios, '12.1'

  #  When using multiple platforms
  #spec.ios.deployment_target = "12.1"
  
  # Module Settings for iOS Development
  #spec.ios.deployment_target = '12.0'

  spec.source = { :git => "https://github.com/carloshpdoc/tooltips.git", :tag => "#{spec.version}" }
  spec.source_files  = "HintsOnboarding", "HintsOnboarding/**/*.{swift}"
  #spec.exclude_files = "HintsOnboarding/Exclude"
  

  # spec.public_header_files = "Classes/**/*.h"

  spec.requires_arc = true
  spec.static_framework = true

  # spec.resource  = "icon.png"
  # spec.resources = "HintsOnboarding/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  spec.framework      = 'UIKIT'
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
    # spec.dependency "Nimble", "9.2.0"
    # spec.dependency "Quick", "4.0.0"

    spec.swift_version = '5.0'
end
