//
//  AddPackView.swift
//  EmojiHubUI
//
//  Created by Ayush Singh on 11/14/24.
//

import SwiftUI
import VariableBlurView

struct AddPackView: View {
    @State var text = ""
    @State private var packTitle: String = ""
    @State private var isPresented: Bool = false
    @State private var selectedEmoji: String = ""
    @State private var packEmojis: [String] = []
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack() {
                VStack(alignment: .leading) {
                    TextField("Enter a name", text: $packTitle)
                        .padding()
                        .foregroundStyle(.white)
                        .font(.title.bold())
                        .fontDesign(.rounded)
                        .tint(.white)
                    
                    Text("\(packEmojis.count) Emoji\(packEmojis.count == 1 ? "" : "s")")
                        .padding(.horizontal)
                        .padding(.vertical, -20)
                        .foregroundStyle(.white.opacity(0.5))
                        .font(.system(size: 17).bold())
                        .fontDesign(.rounded)
                }
                
                // When started, skip helper texts and show grid directly under title
                if packTitle.isEmpty && packEmojis.isEmpty {
                    Spacer()
                    VStack(alignment: .center) {
                        Text("Time to add a title!").padding(.horizontal)
                            .foregroundStyle(.white)
                            .font(.system(size: 17).bold())
                            .fontDesign(.rounded)
                        Text("You can always change this later.").padding(.horizontal)
                            .foregroundStyle(.white)
                            .font(.system(size: 17).weight(.semibold))
                            .fontDesign(.rounded)
                    }
                    Spacer()
                }

                // Emojis grid (always present; just flows up when helpers are hidden)
                let columns = [GridItem(.adaptive(minimum: 64), spacing: 28, alignment: .center)]
                LazyVGrid(columns: columns, alignment: .center, spacing: 24) {
                    ForEach(packEmojis, id: \.self) { item in
                        Text(item)
                            .font(.system(size: 54))
                            .minimumScaleFactor(0.6)
                            .frame(minWidth: 64, minHeight: 64)
                            .frame(maxWidth: .infinity)
                            .contentShape(Rectangle())
                            .accessibilityLabel(Text("Emoji \(item)"))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 32)

                Spacer()
                
            }
            ZStack {
                VStack {
                    VariableBlurView()
                        .frame(height: 170)
                        .allowsHitTesting(false)
                    Spacer()
                }
                .rotationEffect(.degrees(-180))
                .ignoresSafeArea()

                VStack {
                    Spacer()
                    VStack {
                        Button(action: { isPresented = true }) {
                            AddButton()
                        }
                            Text("Add Emoji")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundStyle(.white.opacity(0.5))
                                .padding(.vertical, 3)
                        
                    }
                }
                .sheet(isPresented: $isPresented, content: {
                    VStack(spacing: 26) {
                        
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 60, style: .continuous)
                                .frame(width: 220, height: 220)
                                .foregroundStyle(Color.white.opacity(0.9))
                                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 12)
                                .padding()

                            // Emoji preview
                            Text(!text.isEmpty ? (selectedEmoji.isEmpty ? ((fallVibes + cozyChristmas + movie).randomElement() ?? "🙂") : selectedEmoji) : "")
                                .id(selectedEmoji)
                                .font(.system(size: 96).weight(.semibold))
                                .fontDesign(.rounded)
                                .foregroundStyle(Color(red: 0.58, green: 0.58, blue: 0.58))
                                
                                
                        }

                        TextField("Type to create an emoji…", text: $text)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .submitLabel(.done)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .foregroundStyle(.gray.opacity(0.8))
                            .font(.system(size: 20).weight(.semibold))
                            .fontDesign(.rounded)
                            .tint(.gray.opacity(0.8))
                            .padding(.horizontal)
                            .onChange(of: text) { _, newValue in
                                // Rotate through emojis from the CardContentFactory based on hash.
                                let trimmed = String(newValue.prefix(2))
                                    let all = fallVibes + cozyChristmas + movie
                                    if let pick = all.enumerated().min(by: { abs($0.offset - trimmed.hashValue % max(1, all.count)) < abs($1.offset - trimmed.hashValue % max(1, all.count)) })?.element {
                                        selectedEmoji = pick
                                    
                                }
                            }

                        Spacer()

                        Button(action: {
                            guard !selectedEmoji.isEmpty else { return }
                            // If it's a duplicate emoji, do not animate or insert
                            guard !packEmojis.contains(selectedEmoji) else {
                                isPresented = false
                                text = ""
                                selectedEmoji = ""
                                return
                            }
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.7)) {
                                packEmojis.append(selectedEmoji)
                            }
                            isPresented = false
                            text = ""
                            selectedEmoji = ""
                        }) {
                            AddToPackButton()
                        }
                        .padding(.bottom)
                    }
                    .padding(.top, 80)
                    
                    .padding()
                    .accentColor(.clear)
                })
            }
        }
        
        
    }
    
}

#Preview {
    AddPackView()
}
