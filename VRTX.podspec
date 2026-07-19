Pod::Spec.new do |s|
  s.name             = 'VRTX'
  s.version          = '0.1.0'
  s.summary          = 'The official iOS SDK for Vrtx — onboarding, wallet, and card flows.'
  s.description      = <<-DESC
    Binary (XCFramework) distribution of the official Vrtx iOS SDK, providing
    onboarding, wallet, and card flows. Consumed by vrtx-react-native and by
    native iOS apps via CocoaPods.
  DESC
  s.homepage         = 'https://github.com/vrtx-fintech/vrtx-ios'
  s.license          = { :type => 'Apache-2.0', :text => 'Copyright (C) 2026 vrtx fintech. Licensed under the Apache License, Version 2.0.' }
  s.author           = { 'vrtx fintech' => 'support@vrtx.sa' }
  s.platform         = :ios, '15.6'
  s.swift_version    = '5.9'

  # The release asset unzips to `VRTX.xcframework` at its root. CocoaPods
  # downloads the archive and embeds the (dynamic) framework into the host
  # app — no manual fetch step required.
  s.source           = {
    :http => "https://github.com/vrtx-fintech/vrtx-ios/releases/download/#{s.version}/VRTX.xcframework.zip"
  }
  s.vendored_frameworks = 'VRTX.xcframework'
end
