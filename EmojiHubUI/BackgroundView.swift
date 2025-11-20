//
//  BackgroundView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/13/24.
//

import SwiftUI

struct BackgroundView: View {
    @AppStorage("backgroundStyle") private var selectedStyleRaw: String = BackgroundGradientStyle.normal.rawValue

    var body: some View {
        let style = BackgroundGradientStyle(rawValue: selectedStyleRaw) ?? .normal
        BackgroundGradient(style: style)
            .overlay(
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
            )
    }
}

enum BackgroundGradientStyle: String, CaseIterable, Codable {
    case normal
    case blue
    case brown
    case green
    case gray

    var displayName: String {
        switch self {
        case .normal: return "Default"
        case .blue: return "Blue"
        case .brown: return "Brown"
        case .green: return "Green"
        case .gray: return "Gray"
        }
    }
}

struct BackgroundGradient: View {
    var style: BackgroundGradientStyle = .normal

    var body: some View {
        Group {
            switch style {
            case .normal:
                ZStack {
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.69, green: 0.64, blue: 0.58), location: 0.0),
                            .init(color: Color(red: 0.53, green: 0.49, blue: 0.45), location: 0.55),
                            .init(color: Color(red: 0.42, green: 0.38, blue: 0.34), location: 1.0)
                        ]),
                        center: UnitPoint(x: 0.72, y: 0.38),
                        startRadius: 20,
                        endRadius: 900
                    )
                    .ignoresSafeArea()

                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.82, green: 0.60, blue: 0.39), location: 0.0),
                            .init(color: Color(red: 0.77, green: 0.47, blue: 0.34), location: 0.35),
                            .init(color: Color(red: 0.77, green: 0.69, blue: 0.57), location: 0.78),
                            .init(color: Color(red: 0.68, green: 0.66, blue: 0.63), location: 1.0)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .blendMode(.overlay)
                    .opacity(0.85)
                    .ignoresSafeArea()

                    LinearGradient(
                        colors: [
                            Color.clear,
                            Color.white.opacity(0.05),
                            Color.white.opacity(0.10)
                        ],
                        startPoint: .center,
                        endPoint: .bottomTrailing
                    )
                    .blendMode(.softLight)
                    .ignoresSafeArea()
                }
            case .blue:
                ZStack {
                    // Base cool radial fog near upper-right
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.90, green: 0.95, blue: 0.99), location: 0.0),  // airy sky center
                            .init(color: Color(red: 0.78, green: 0.88, blue: 0.96), location: 0.55), // powder blue halo
                            .init(color: Color(red: 0.56, green: 0.72, blue: 0.88), location: 1.0)  // soft blue edge - darker for contrast
                        ]),
                        center: UnitPoint(x: 0.78, y: 0.30),
                        startRadius: 10,
                        endRadius: 900
                    )
                    .ignoresSafeArea()

                    // Sweep of saturated sky blue from top-left to bottom-left
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.52, green: 0.78, blue: 0.98), location: 0.0),  // bright sky
                            .init(color: Color(red: 0.44, green: 0.72, blue: 0.96), location: 0.35), // rich sky
                            .init(color: Color(red: 0.70, green: 0.86, blue: 0.98), location: 0.78), // pale sky
                            .init(color: Color(red: 0.84, green: 0.92, blue: 0.98), location: 1.0)   // very light edge
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .blendMode(.overlay)
                    .opacity(0.78)
                    .ignoresSafeArea()

                    // Subtle bright band across center-left to mimic horizontal haze
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.00),
                            Color.white.opacity(0.08),
                            Color.white.opacity(0.00)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .scaleEffect(y: 0.6)
                    .offset(y: -20)
                    .blendMode(.softLight)
                    .ignoresSafeArea()

                    LinearGradient(
                        colors: [
                            Color.black.opacity(0.00),
                            Color(red: 0.10, green: 0.20, blue: 0.35).opacity(0.10),
                            Color.black.opacity(0.00)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .scaleEffect(y: 0.8)
                    .blendMode(.multiply)
                    .ignoresSafeArea()

                    // Gentle deepening toward bottom-left corner
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.black.opacity(0.00), location: 0.0),
                            .init(color: Color.black.opacity(0.08), location: 1.0)
                        ]),
                        center: .bottomLeading,
                        startRadius: 10,
                        endRadius: 700
                    )
                    .blendMode(.multiply)
                    .ignoresSafeArea()
                }
            case .brown:
                ZStack {
                    // Soft bright beige center-right glow
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.94, green: 0.86, blue: 0.72), location: 0.0), // warm light sand center
                            .init(color: Color(red: 0.80, green: 0.62, blue: 0.42), location: 0.55), // caramel halo
                            .init(color: Color(red: 0.42, green: 0.28, blue: 0.18), location: 1.0)  // deep cocoa edge
                        ]),
                        center: UnitPoint(x: 0.78, y: 0.34),
                        startRadius: 10,
                        endRadius: 900
                    )
                    .ignoresSafeArea()

                    // Warm sweep from top-left orange through terracotta to pale right/beige
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.82, green: 0.46, blue: 0.18), location: 0.0),  // burnt orange top-left
                            .init(color: Color(red: 0.66, green: 0.34, blue: 0.20), location: 0.32), // terracotta mid-left
                            .init(color: Color(red: 0.76, green: 0.62, blue: 0.44), location: 0.74), // warm tan bottom-right
                            .init(color: Color(red: 0.64, green: 0.54, blue: 0.42), location: 1.0)   // muted warm beige edge
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .blendMode(.overlay)
                    .opacity(0.85)
                    .ignoresSafeArea()

                    // Gentle lift to brighten lower-right corner
                    LinearGradient(
                        colors: [
                            Color.clear,
                            Color.white.opacity(0.05),
                            Color.white.opacity(0.10)
                        ],
                        startPoint: .center,
                        endPoint: .bottomTrailing
                    )
                    .blendMode(.softLight)
                    .ignoresSafeArea()

                    // Slight deepening toward bottom-left to echo the terracotta mass
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.black.opacity(0.00), location: 0.0),
                            .init(color: Color.black.opacity(0.14), location: 1.0)
                        ]),
                        center: .bottomLeading,
                        startRadius: 10,
                        endRadius: 700
                    )
                    .blendMode(.multiply)
                    .ignoresSafeArea()
                }
            case .green:
                ZStack {
                    // Soft green radial glow toward upper-right
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.86, green: 0.97, blue: 0.90), location: 0.0), // cool mint center
                            .init(color: Color(red: 0.52, green: 0.86, blue: 0.60), location: 0.55), // fresh leaf halo
                            .init(color: Color(red: 0.16, green: 0.54, blue: 0.28), location: 1.0)  // rich forest edge
                        ]),
                        center: UnitPoint(x: 0.82, y: 0.28),
                        startRadius: 10,
                        endRadius: 900
                    )
                    .ignoresSafeArea()

                    // Sweep from saturated green top-left to lighter bottom-right
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.10, green: 0.60, blue: 0.24), location: 0.0),  // vivid leafy green
                            .init(color: Color(red: 0.16, green: 0.72, blue: 0.30), location: 0.35), // brighter spring green
                            .init(color: Color(red: 0.44, green: 0.84, blue: 0.52), location: 0.78), // light lime-green
                            .init(color: Color(red: 0.70, green: 0.92, blue: 0.74), location: 1.0)   // pale mint edge
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .blendMode(.overlay)
                    .opacity(0.85)
                    .ignoresSafeArea()

                    // Subtle horizontal haze to mimic bloom
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.00),
                            Color.white.opacity(0.06),
                            Color.white.opacity(0.00)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .scaleEffect(y: 0.6)
                    .offset(y: -20)
                    .blendMode(.softLight)
                    .ignoresSafeArea()

                    // Gentle deepening toward bottom-left
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.black.opacity(0.00), location: 0.0),
                            .init(color: Color.black.opacity(0.16), location: 1.0)
                        ]),
                        center: .bottomLeading,
                        startRadius: 10,
                        endRadius: 700
                    )
                    .blendMode(.multiply)
                    .ignoresSafeArea()
                }
            case .gray:
                ZStack {
                    // Neutral radial glow toward upper-right
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(white: 0.92), location: 0.0),  // slightly darker near-white center
                            .init(color: Color(white: 0.74), location: 0.55),  // darker light gray halo
                            .init(color: Color(white: 0.56), location: 1.0)    // darker medium gray edge
                        ]),
                        center: UnitPoint(x: 0.80, y: 0.30),
                        startRadius: 10,
                        endRadius: 900
                    )
                    .ignoresSafeArea()

                    // Subtle sweep from darker top-left to lighter bottom-right
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(white: 0.44), location: 0.0),   // darker gray top-left
                            .init(color: Color(white: 0.58), location: 0.35),  // mid gray
                            .init(color: Color(white: 0.78), location: 0.78),  // light gray bottom-right
                            .init(color: Color(white: 0.86), location: 1.0)    // very light edge
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .blendMode(.overlay)
                    .opacity(0.85)
                    .ignoresSafeArea()

                    // Horizontal haze band
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.00),
                            Color.white.opacity(0.10),
                            Color.white.opacity(0.00)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .scaleEffect(y: 0.6)
                    .offset(y: -20)
                    .blendMode(.softLight)
                    .ignoresSafeArea()

                    // Gentle deepening toward bottom-left
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.black.opacity(0.00), location: 0.0),
                            .init(color: Color.black.opacity(0.14), location: 1.0)
                        ]),
                        center: .bottomLeading,
                        startRadius: 10,
                        endRadius: 700
                    )
                    .blendMode(.multiply)
                    .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    BackgroundView()
        .preferredColorScheme(.light)
}
