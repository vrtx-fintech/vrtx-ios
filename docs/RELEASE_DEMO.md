# Demo App Release

The Example (demo) app is released independently from the SDK via the
`Release Demo App` workflow (`.github/workflows/release-demo.yml`). The SDK's
own release pipeline (`release.yml`) is unchanged and continues to drive
XCFramework GitHub Releases on `vX.Y.Z` tags.

## Triggering a release

Actions → "Release Demo App" → Run workflow. Inputs:

| Input | Description |
| --- | --- |
| `bump` | `patch`, `minor`, `major`, or `explicit`. The next semver is computed from the latest `demo-v*.*.*` tag. |
| `version` | Required only when `bump=explicit`. Must be `X.Y.Z`. |
| `breaking_changes` | Boolean. **Must be paired with `bump=major`** — the workflow fails fast otherwise. |
| `environment` | `sandbox`, `staging`, or `both`. Both fan out as a matrix. |
| `release_notes` | Multi-line. Used to annotate the `demo-vX.Y.Z` git tag. Note: the workflow does not currently push these notes to TestFlight's "What to Test"; that's a follow-up that needs the App Store Connect API. |
| `dry_run` | If `true`, builds and signs but skips Appetize/TestFlight uploads, the version bump commit, and the tag push. |

## What the workflow does

1. Resolves the next semver from the latest `demo-v*.*.*` tag.
2. For each selected environment, in parallel:
   - Bumps `MARKETING_VERSION` and `CURRENT_PROJECT_VERSION` in `Example/Example.xcodeproj` via `agvtool`.
   - Builds the Example app for simulator with the env's xcconfig (`Config/Sandbox.xcconfig` or `Config/Staging.xcconfig`) and uploads to Appetize.
   - Builds, signs, and exports a device IPA, then uploads to TestFlight via `xcrun altool`.
3. After all matrix legs pass, commits the version bump to `main`, pushes the `demo-vX.Y.Z` tag.

## Required Actions secrets

The matrix job uses `environment: ${{ matrix.environment }}`, so each leg
runs under its own GitHub Environment (`sandbox` / `staging`) and only
sees that environment's secrets. This lets you attach per-env protection
rules — `sandbox` is the production-adjacent env so it carries required
reviewers + branch restrictions; `staging` is the open dev target — and
keeps the sandbox signing material invisible to a staging-only run.

### Per-environment secrets (define on **both** the `sandbox` and `staging` environments)

| Secret | Notes |
| --- | --- |
| `VRTX_CLIENT_SECRET` | OAuth client secret for the env's tenant. Different value on sandbox vs staging. |
| `IOS_PROVISIONING_PROFILE_BASE64` | Base64 of the `.mobileprovision` for the env (`VRTX Sandbox` / `VRTX Staging`). |

### Repo-level secrets (shared across both envs, inherited automatically)

| Secret | Notes |
| --- | --- |
| `APPETIZE_API_TOKEN` | Already present (used by the previous deploy workflow). |
| `APP_STORE_CONNECT_API_KEY_ID` | App Store Connect API key ID. |
| `APP_STORE_CONNECT_API_ISSUER_ID` | App Store Connect API issuer ID. |
| `APP_STORE_CONNECT_API_KEY_BASE64` | Base64 of the `.p8` private key. |
| `IOS_DISTRIBUTION_CERT_BASE64` | Base64 of the distribution `.p12`. |
| `IOS_DISTRIBUTION_CERT_PASSWORD` | Password for the `.p12`. |
| `KEYCHAIN_PASSWORD` | Any random string; used to lock the temp keychain on the runner. |
| `SLACK_WEBHOOK_URL` | Optional. Incoming-webhook URL used by the `notify-slack` job to post `iOS SDK <version> Available` after a real release. Missing secret = job logs a warning and exits 0 (the release itself still ships). |

### One-time GitHub setup

1. Settings → Environments → **New environment** → `staging` (open to devs; no protection rules required — `staging` is the developer-facing target in this project).
2. Settings → Environments → **New environment** → `sandbox` (production-adjacent; recommended: tick *Required reviewers*, restrict *Deployment branches* to `main`).
3. Add `VRTX_CLIENT_SECRET` and `IOS_PROVISIONING_PROFILE_BASE64` to **each** environment with the right per-env value.
4. Add the rest as repo-level secrets (Settings → Secrets and variables → Actions).

The pre-existing `VRTX_CLIENT_SECRET_SANDBOX` / `VRTX_CLIENT_SECRET_STAGING` and `IOS_PROVISIONING_PROFILE_SANDBOX_BASE64` / `IOS_PROVISIONING_PROFILE_STAGING_BASE64` (if you created them earlier) can be deleted once the per-env secrets are in place.

### Producing base64 values

`base64 -i path/to/file | tr -d '\n'` on macOS. The base64 should not have line wrapping; pass `-w 0` on GNU base64 if needed.

## Local builds

Local Xcode runs of the Example app don't pass `-xcconfig` so the env defaults
to `sandbox` at runtime. To exercise a real backend locally, copy
`Config/Secrets.local.xcconfig.example` to `Config/Secrets.local.xcconfig`
(gitignored) and fill in `VRTX_CLIENT_SECRET`. The Sandbox/Staging xcconfigs
include this file via `#include?` (optional include).
