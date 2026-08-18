Pod::Spec.new do |s|
  s.name             = 'VRTX'
  s.version          = '0.1.3'
  s.summary          = 'The official iOS SDK for Vrtx — onboarding, wallet, and card flows.'
  s.description      = <<-DESC
    Binary (XCFramework) distribution of the official Vrtx iOS SDK, providing
    onboarding, wallet, and card flows. Consumed by vrtx-flutter,
    vrtx-react-native and by native iOS apps via CocoaPods.
  DESC
  s.homepage         = 'https://github.com/vrtx-fintech/vrtx-ios'
  s.license          = { :type => 'Apache-2.0', :text => 'Copyright (C) 2026 vrtx fintech. Licensed under the Apache License, Version 2.0.' }
  s.author           = { 'vrtx fintech' => 'support@vrtx.sa' }
  s.platform         = :ios, '15.6'
  s.swift_version    = '5.9'

  # CocoaPods consumes a dedicated archive (`VRTX.cocoapods.zip`), not the
  # SwiftPM one. The two channels need different payloads: SwiftPM resolves
  # exactly one xcframework per binaryTarget archive, while CocoaPods has no
  # transitive route to TalsecRuntime and needs it delivered here. Both are
  # published on every release; see vrtx-sdk-ios/.github/workflows/release.yml.
  #
  # `:sha256` is not optional. Without it CocoaPods downloads this archive over
  # the network with no integrity check at all, which for a payments SDK binary
  # is an unacceptable supply-chain gap. The release pipeline rewrites the
  # version, URL and checksum together and fails if either rewrite misses.
  s.source           = {
    :http => "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.3/VRTX.cocoapods.zip",
    # Placeholder: overwritten with the real checksum by the release pipeline.
    # `pod trunk push` runs `pod lib lint`, which downloads the archive and
    # verifies this value, so a stale placeholder fails the publish rather than
    # shipping an unverified binary.
    :sha256 => '0000000000000000000000000000000000000000000000000000000000000000'
  }

  # VRTX.framework links TalsecRuntime dynamically
  # (`LC_LOAD_DYLIB → @rpath/TalsecRuntime.framework/TalsecRuntime`), so the
  # runtime has to be embedded in the host app or it fails to launch. Talsec
  # publishes no pod — Free-RASP-iOS is SwiftPM-only — so there is nothing to
  # depend on and the framework travels inside our archive instead. freeRASP is
  # MIT-licensed; its notice ships as `TalsecRuntime-LICENSE.txt` in the archive.
  s.vendored_frameworks = 'VRTX.xcframework', 'TalsecRuntime.xcframework'

  # DeviceKit appears in VRTX's public `.swiftinterface`, so consumers need the
  # module to compile against VRTX even though it links statically. Pinned to
  # the exact version the xcframework is built against — a module compiled by a
  # different DeviceKit is a build error, not a soft incompatibility.
  s.dependency 'DeviceKit', '= 5.7.0'
end
