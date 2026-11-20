# MelodyBox – Phase 1 & 2 setup

1. Xcode > File > New > Project > iOS > App. Name: MelodyBox, Interface: SwiftUI, Storage: None, Language: Swift.
2. Set Minimum Deployments to iOS 17.0, device: iPhone.
3. Delete the generated MelodyBoxApp.swift and ContentView.swift.
4. Drag the folders App, Models, Theme, Persistence, Views, Components into the project
   (tick "Copy items if needed" and "Create groups").
5. Signing & Capabilities > + Capability > Background Modes > tick "Audio, AirPlay, and Picture in Picture"
   (needed from Phase 7).
6. Run on an iPhone simulator or device (Cmd+R).

Info.plist keys needed later:
- NSAppleMusicUsageDescription (Phase 9, optional Apple Music access)
- UIBackgroundModes: audio (added by the capability above)
