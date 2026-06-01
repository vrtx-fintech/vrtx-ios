Pod::Spec.new do |s|
  s.name = 'VRTX'
  s.version = '0.0.15'
  s.summary = 'The official iOS SDK for Vrtx.'
  s.description = 'The official iOS SDK for Vrtx onboarding, wallet, and card flows.'
  s.homepage = 'https://github.com/vrtx-fintech/vrtx-ios'
  s.license = {
    :type => 'Apache-2.0',
    :text => 'Licensed under the Apache License, Version 2.0. See https://www.apache.org/licenses/LICENSE-2.0'
  }
  s.author = { 'vrtx fintech' => 'support@vrtx.sa' }

  s.platform = :ios, '15.6'
  s.swift_version = '5.9'
  s.requires_arc = true

  s.source = {
    :http => "https://github.com/vrtx-fintech/vrtx-ios/releases/download/#{s.version}/VRTX.xcframework.zip",
    :sha256 => '961b5722a4a664b29050eda493374b9d444564aa36cff6a90a0dc3735887f88f'
  }
  s.vendored_frameworks = 'VRTX.xcframework'
end
