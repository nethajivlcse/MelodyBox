import SwiftUI

extension Color {
    init(hex: UInt32, opacity: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xFF) / 255,
                  green: Double((hex >> 8) & 0xFF) / 255,
                  blue: Double(hex & 0xFF) / 255,
                  opacity: opacity)
    }
}

enum AppTheme: String, CaseIterable, Identifiable {
    case system, dark, light
    var id: String { rawValue }

    var title: String {
        switch self {
        case .system: return "System"
        case .dark: return "Dark"
        case .light: return "Light"
        }
    }

    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .dark: return .dark
        case .light: return .light
        }
    }
}

enum MB {
    static let accent = Color(hex: 0xA78BFA)
    static let darkBackground = Color(hex: 0x11121C)
    static let darkSurface = Color(hex: 0x1C1D2B)
    static let lightBackground = Color(hex: 0xF7F6FB)
    static let lightSurface = Color.white

    static func background(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? darkBackground : lightBackground
    }
    static func surface(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? darkSurface : lightSurface
    }
}

struct MBBackground: ViewModifier {
    @Environment(\.colorScheme) private var scheme
    func body(content: Content) -> some View {
        content.background(MB.background(scheme).ignoresSafeArea())
    }
}

extension View {
    func mbBackground() -> some View { modifier(MBBackground()) }
}
