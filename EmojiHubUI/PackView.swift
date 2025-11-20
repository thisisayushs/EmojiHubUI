//
//  PackView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/14/24.
//

import SwiftUI
import VariableBlurView

struct PackView: View {
    let emojis: [String]
    @State private var showAlert = false
    private func packTitle(from emojis: [String]) -> String {
        if emojis == fallVibes { return "Fall Vibes" }
        if emojis == cozyChristmas { return "Cozy Christmas" }
        if emojis == movie { return "Cinema Core" }
        return "Pack"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    HeaderView(title: packTitle(from: emojis), iconName: "ellipsis", subTitleText: "\(emojis.count) Stickers")
                    
                    ScrollView(.vertical) {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()], spacing: 10) {
                                ForEach(emojis, id: \.self) { item in
                                    NavigationLink(destination: EmojiDetailView(emoji: item, packName: packTitle(from: emojis))) {
                                        Text(item)
                                            .font(.system(size: 50))
                                    }
                                }
                            }
                        }.padding(.bottom, 125)
                    }
                }
                ZStack {
                    VStack {
                        
                        
                        VariableBlurView()
                            .frame(height: 170)
                            .allowsHitTesting(false)
                        
                        Spacer()
                        
                    }.rotationEffect(.degrees(-180))
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                showAlert = true
                            }) {
                                AddButton(iconName: "plus.message.fill")
                            }
                            Text("Add to Keyboard")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundStyle(.white.opacity(0.5))
                                .padding(.vertical, 3)
                        }
                    }
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
        }.accentColor(.white)
    }
}

#Preview {
    PackView(emojis: fallVibes)
        .preferredColorScheme(.light)
}
