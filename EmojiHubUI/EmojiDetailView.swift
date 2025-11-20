//
//  EmojiDetailView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/15/24.
//

import SwiftUI

struct EmojiDetailView: View {
    let emoji: String
    let packName: String
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    
                    Spacer()
                    VStack {
                        Text(emoji)
                            .font(.system(size: 172))
                        
                        VStack {
                            HStack {
                                
                                Text("Part of the")
                                Text(packName).foregroundStyle(.white)
                                
                            }
                            Text("Emoji Hub pack")
                        }
                    }
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(.white.opacity(0.5))
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            showAlert = true
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: "plus.message.fill")
                                    .font(.system(size: 22, weight: .semibold))
                                Text("Add to Keyboard")
                                    .font(.system(size: 20, weight: .semibold))
                            }
                            .foregroundStyle(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                        }
                        Spacer()
                    }
                    .padding(.bottom, 40)
                }
            }
            .alert("This functionality is yet to be implemented.", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAlert = true
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .padding(.bottom, 3)
                    }
                }
            }
        }
    }
}

#Preview {
    EmojiDetailView(emoji: "🥮", packName: "Fall Vibes")
        .preferredColorScheme(.light)
}
