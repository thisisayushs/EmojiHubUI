//
//  CardView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/14/24.
//

import SwiftUI

struct CardView: View {
    @State private var showShareAlert = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(
                    Color(
                        red: 0.2,
                        green: 0.2,
                        blue: 0.2)
                    .opacity(0.5))
                .frame(height: 160)
                .padding(.horizontal)
        }
        
    }
}

#Preview {
    CardView()
        .preferredColorScheme(.light)
}
