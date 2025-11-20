//
//  SettingsView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/13/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("backgroundStyle") private var selectedStyleRaw: String = BackgroundGradientStyle.normal.rawValue
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
                .overlay {
                    // Dark transparent tint over background
                    Color.black.opacity(0.45)
                        .ignoresSafeArea()
                }
            
            VStack(spacing: 20) {
                // Header
                HeaderView(title: "Settings")
                
                // Background section label
                HStack(spacing: 8) {
                    Image(systemName: "paintpalette.fill")
                    Text("Background")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .foregroundStyle(.white.opacity(0.6))
                .font(.headline.weight(.semibold))
                
                // Background selector row (interactive)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(BackgroundGradientStyle.allCases, id: \.self) { style in
                            let isSelected = selectedStyleRaw == style.rawValue
                            BackgroundStyleSwatch(style: style, isSelected: isSelected)
                               
                                .onTapGesture {
                                    selectedStyleRaw = style.rawValue
                                }
                                
                        }
                    }
                    .padding()
                    
                }
                
                // Help button
                VStack {
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Text("Help")
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    .foregroundStyle(.white.opacity(0.5))
                    Button(action: {showAlert = true}) {
                        HelpButton()
                            .padding(.horizontal)
                    }
                }
                    
                Spacer()
                
                // Footer with restore + upgrade
                VStack(spacing: 10) {
                    Button(action: {
                        showAlert = true
                    }
                    ) {
                        Text("Restore purchase")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    Button(action: {
                        showAlert = true
                    }) {
                        UpgradeButton()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .alert("This functionality is yet to be implemented.", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
        
    }
}

private struct BackgroundStyleSwatch: View {
    let style: BackgroundGradientStyle
    var isSelected: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color.clear)
            
            .overlay(
                BackgroundGradient(style: style)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            )
        
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.white.opacity(isSelected ? 0.9 : 0.4), lineWidth: isSelected ? 3 : 1.5)
            )
        
            .frame(width: 56, height: 80)
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.black.opacity(0.2))
            )
            
            
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.light)
}

