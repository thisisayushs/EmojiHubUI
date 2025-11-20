//
//  CardContentView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/13/24.
//

import SwiftUI

struct CardContentView: View {
    let content: [String]
    
    // Map known content sets to their titles for a concise lookup
    private var generateTitle: String {
        let mapping: [([String], String)] = [
            (fallVibes, "Fall Vibes"),
            (cozyChristmas, "Cozy Christmas"),
            (movie, "Cinema Core")
        ]
        return mapping.first { $0.0 == content }?.1 ?? "Uh oh!"
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // Adaptive grid so emojis wrap based on available width
            let columns = [GridItem(.adaptive(minimum: 64), spacing: 28, alignment: .center)]
            
            HStack { // Center the grid within the available width
                Spacer(minLength: 0)
                LazyVGrid(columns: columns, alignment: .center, spacing: 24) {
                    ForEach(Array(content.prefix(3)), id: \.self) { item in
                        Text(item)
                            .font(.system(size: 54))
                            .minimumScaleFactor(0.6)
                            .frame(minWidth: 64, minHeight: 64)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .contentShape(Rectangle())
                        
                    }
                }
                .padding(.horizontal, 32)
                .frame(maxWidth: 400, alignment: .center)
                Spacer(minLength: 0)
            }
            
            VStack(spacing: 6) {
                Text("\(content.count) Stickers")
                    .font(.callout.weight(.bold))
                    .foregroundStyle(.white.opacity(0.5))
                
                
                Text(generateTitle)
                    .font(.title.bold())
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 12)
            }
            .fontDesign(.rounded)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    CardContentView(content: fallVibes)
        .preferredColorScheme(.dark)
}

