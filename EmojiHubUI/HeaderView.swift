//
//  HeaderView.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/14/24.
//

import SwiftUI

struct HeaderView: View {
    var title = "Your Emoji"
    var iconName: String = "gearshape.fill"
    var subTitleText = ""
    var body: some View {
        VStack(spacing: -18) {
            HStack {
                Text(title)
                    .padding()
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack {
                Text(subTitleText)
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundStyle(.white.opacity(0.4))
                Spacer()
            }.padding(.horizontal, 20)
            
        }
    }
}


#Preview {
    HeaderView()
        .preferredColorScheme(.light)
}
