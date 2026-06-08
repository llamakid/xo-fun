# App Store Submission Checklist

## Step 1 — Apple Developer Account
- [x] Enroll at developer.apple.com/programs/enroll ($99/year)
- [x] Wait for activation (a few hours, up to 48hrs)

## Step 2 — App Icon
- [x] 1024×1024px PNG created (off-white background, blue X / red O on grid)
- [x] Asset catalog wired up at Assets.xcassets/AppIcon.appiconset/

## Step 3 — Privacy Policy
- [x] Draft policy text
- [x] Hosted at https://www.llamakid.com/privacy/xo-fun-app
- [x] Note the URL for App Store Connect

## Step 4 — App Store Connect Setup
- [ ] Create the app at appstoreconnect.apple.com
- [ ] App name: XO Fun - Tic Tac Toe
- [ ] Bundle ID: com.nateguys.tictactoe
- [ ] Category: Games → Board
- [ ] Age rating: 4+
- [ ] Add privacy policy URL: https://www.llamakid.com/privacy/xo-fun-app
- [x] Write description and keywords (see below)
- [x] Screenshots taken (iPhone 17 Pro Max) — saved to Screenshots/

## Step 5 — Privacy Nutrition Labels (in App Store Connect)
- [ ] Declare AdMob data collection under App Privacy
- [ ] Note: no App Tracking Transparency prompt needed (child-directed treatment is set)

## Step 6 — Build & Submit
- [ ] Run `xcodegen generate`
- [ ] In Xcode: Product → Archive
- [ ] Upload via Xcode Organizer
- [ ] Submit for review in App Store Connect

---

## App Store Description & Keywords

### Description
XO Fun - Tic Tac Toe is the classic game designed for kids and families — calm, simple, and ready to play in seconds.

Hand the phone to a friend or family member and take turns tapping your X or O. First to get three in a row wins the round!

**Features:**
- Two players, one device — no setup, no accounts, no internet
- Score tracker carries over between rounds
- Soft colors and clean design — no flashing, no noise, no distractions
- Tiny download, instant play — nothing to learn, nothing to configure

### Keywords (98 chars)
```
tic tac toe,tictactoe,xo,kids game,family game,two player,board game,calm,simple,noughts crosses
```

---

## Already Done
- [x] App name updated to "XO Fun - Tic Tac Toe" (display name); in-game header stays "XO Fun"
- [x] Launch screen — low-stim, off-white, blue X / red O, matches game palette
- [x] App icon — 1024×1024 PNG, clean grid design matching game colors
- [x] Real AdMob App ID and Ad Unit ID wired in
- [x] Ad banner fixed — window-based width, dynamic height from delegate
- [x] COPPA child-directed treatment flag set at app launch
- [x] SKAdNetwork identifiers added to Info.plist
- [x] Portrait-only lock
- [x] Bundle ID: com.nateguys.tictactoe
- [x] iOS 16+ deployment target
- [x] Privacy policy hosted at https://www.llamakid.com/privacy/xo-fun-app
- [x] Apple Developer account enrolled
