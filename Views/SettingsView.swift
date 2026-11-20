import SwiftUI

struct SettingsView: View {
    @AppStorage("appTheme") private var themeRaw = AppTheme.dark.rawValue

    var body: some View {
        NavigationStack {
            Form {
                Section("Appearance") {
                    Picker("Theme", selection: $themeRaw) {
                        ForEach(AppTheme.allCases) { Text($0.title).tag($0.rawValue) }
                    }
                    .pickerStyle(.segmented)
                }
                Section("About") {
                    LabeledContent("Version",
                                   value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0")
                    Text("MelodyBox works offline. No account, no tracking.")
                        .font(.footnote).foregroundStyle(.secondary)
                }
            }
            .scrollContentBackground(.hidden)
            .mbBackground()
            .navigationTitle("Settings")
        }
    }
}
