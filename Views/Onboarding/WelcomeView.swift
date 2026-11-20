import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var appeared = false

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                Spacer(minLength: 40)

                ZStack {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .fill(LinearGradient(colors: [MB.accent, Color(hex: 0x6D4AFF)],
                                             startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 120, height: 120)
                        .shadow(color: MB.accent.opacity(0.5), radius: 24, y: 10)
                    Image(systemName: "music.note")
                        .font(.system(size: 52, weight: .bold))
                        .foregroundStyle(.white)
                }
                .scaleEffect(appeared ? 1 : 0.7)
                .opacity(appeared ? 1 : 0)
                .accessibilityHidden(true)

                VStack(spacing: 8) {
                    Text("MelodyBox").font(.largeTitle.bold())
                    Text("Your music, your library, offline.")
                        .font(.title3).foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }

                VStack(alignment: .leading, spacing: 18) {
                    OptionRow(icon: "folder.badge.plus",
                              title: "Import from Files",
                              text: "Pick MP3, M4A, AAC, WAV or AIFF files. They are copied into MelodyBox and play fully offline.")
                    OptionRow(icon: "person.2.wave.2",
                              title: "Organized for you",
                              text: "Songs are grouped by artist and album using their tags. You can tag songs with movies yourself.")
                    OptionRow(icon: "applelogo",
                              title: "Apple Music (optional)",
                              text: "You can later allow access to your Apple Music library. Streaming tracks stay separate from your imported files and need a connection.")
                    OptionRow(icon: "lock.shield",
                              title: "Private by design",
                              text: "No account, no sign-in, no uploads. iOS doesn't let apps read every file on your phone, so you choose what to import.")
                }
                .padding(.horizontal)

                Button {
                    coordinator.finishOnboarding()
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(MB.accent, in: Capsule())
                        .foregroundStyle(.black)
                }
                .padding(.horizontal, 24)
                .padding(.top, 8)
            }
            .padding(.bottom, 32)
        }
        .mbBackground()
        .onAppear { withAnimation(.spring(duration: 0.8)) { appeared = true } }
    }
}

private struct OptionRow: View {
    let icon: String, title: String, text: String
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.title2).foregroundStyle(MB.accent)
                .frame(width: 34)
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.headline)
                Text(text).font(.subheadline).foregroundStyle(.secondary)
            }
        }
        .accessibilityElement(children: .combine)
    }
}
