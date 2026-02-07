# 4.8 iOS App - High-Rated Places Map

## Features
- SwiftUI app with Google Maps
- Search places near Sydney (rating &gt;= 4.8)
- Markers with name and rating

## Full Setup Instructions

### 1. Create New Xcode Project
- Open Xcode
- File &gt; New &gt; Project
- iOS &gt; App
- Product Name: `4.8`
- Team: Personal Team or later set to `76RZDQQAK3`
- Organization ID: `au.com.sidekickcreative`
- Interface: SwiftUI
- Language: Swift
- Use Core Data: No
- Include Tests: No
- iOS Deployment Target: 18.0
- Save to folder (e.g., ~/Desktop/4.8)

### 2. Add Project Files
- Copy `Podfile` to project root (next to `4.8.xcodeproj`)
- Delete default `ContentView.swift` and `4.8App.swift`
- Drag `Source/4.8` folder into Xcode navigator (Create groups, Add to target `4.8`)

### 3. Configure Project
**Signing &amp; Capabilities tab:**
- Bundle Identifier: `au.com.sidekickcreative.foureight`
- Team: `76RZDQQAK3` (select your team)

**Info.plist (open as Source Code, add before `&lt;/dict&gt;`):**
```
&lt;key&gt;NSLocationWhenInUseUsageDescription&lt;/key&gt;
&lt;string&gt;Location access needed to center map and find nearby places.&lt;/string&gt;
```

### 4. API Key
- Get Google API key: [Google Cloud Console](https://console.cloud.google.com/)
- Enable: Maps SDK for iOS, Places API (New)
- Edit `4.8App.swift`: Replace `YOUR_GOOGLE_MAPS_API_KEY` with your key

### 5. Install Pods
```
cd ~/Desktop/4.8  # your project dir
pod install
```
Open `4.8.xcworkspace`

### 6. Build &amp; Deploy
- Build (Cmd+B)
- For TestFlight: Product &gt; Archive &gt; Distribute App &gt; App Store Connect &gt; TestFlight

## Usage
- App launches with Sydney-centered map
- Bottom search: Enter query (e.g., \"coffee\", \"pizza\"), press return
- Yellow markers for places rated 4.8+
- Tap Clear to remove markers

## Notes
- Radius: 10km around Sydney CBD
- Uses Places Nearby Search API (server filters rating &gt;=4.8)
- iOS 18.0+, Xcode 16+