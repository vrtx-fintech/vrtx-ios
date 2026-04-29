# VRTX

## Description

VRTX is the iOS wallet/onboarding SDK that allows host apps to integrate KYC and wallet flows (OTP, Nafath verification, wallet login, card flows) without building the underlying infrastructure.

## Requirements

- iOS 15.6+
- UIKit host app (the SDK presents its own navigation flow)

## Documentation

- iOS integration guide: [ios-integration-guide.md](docs/ios-integration-guide.md)

## Contributing

Guidelines for how others can contribute to your project.

## Linting

This repo uses SwiftFormat and SwiftLint via pre-commit.

1. Install tools: `brew install pre-commit swiftformat swiftlint`
2. Enable hooks: `pre-commit install`
3. Run on demand: `pre-commit run --all-files`
