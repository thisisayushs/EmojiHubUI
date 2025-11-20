//
//  HomeView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/13/24.
//

import SwiftUI
import VariableBlurView

struct HomeView: View {
    @State private var navigateToAddPack = false
    @State private var cardEmojis: [[String]] = (0..<5).map { _ in generateRandomContent() }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    
                    HStack {
                        HeaderView()
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            RoundButton()
                        }
                    }
                    
                    NavigationStack {
                        List {
                            
                            ForEach(0..<5) { i in
                                
                                ZStack {
                                    CardView()
                                    CardContentView(content: cardEmojis[i])
                                    NavigationLink(destination: PackView(emojis: cardEmojis[i])) {
                                        EmptyView()
                                    }
                                    .opacity(0.0)
                                    
                                }
                                
                            }
                            .listRowInsets(EdgeInsets.init(top: 10, leading: -15, bottom: 10, trailing: -15))
                            .listRowBackground(Color.clear)
                            .listRowSeparatorTint(.clear)
                            
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: .infinity, height: 100)
                                .foregroundStyle(.clear)
                            
                                .listRowBackground(Color.clear)
                                .listRowSeparatorTint(.clear)
                            
                            
                        }
                        .scrollContentBackground(.hidden)
                        .background(BackgroundView())
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
                            Button(action: { navigateToAddPack = true }) {
                                AddButton()
                            }
                            Text("Add Pack")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundStyle(.white.opacity(0.5))
                                .padding(.vertical, 3)
                        }
                    }
                    .navigationDestination(isPresented: $navigateToAddPack) {
                        AddPackView()
                    }
                }
                
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.light)
}

