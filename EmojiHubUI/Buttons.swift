//
//  Buttons.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/13/24.
//

import SwiftUI

struct AddButton: View {
    var iconName = "plus"
    var body: some View {
        VStack {
            Image(systemName: iconName)
            .foregroundStyle(.white)
                .font(.system(size: 28))
                .fontDesign(.rounded)
                .fontWeight(.bold)
                .padding(.horizontal, 28)
                .padding(.vertical, 16)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
}

struct AddToPackButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 340, height: 70)
                .foregroundStyle(LinearGradient(stops: [
                    Gradient.Stop(color: Color(red: 1, green: 0.93, blue: 0.81), location: 0.00),
                    Gradient.Stop(color: Color(red: 1, green: 0.82, blue: 0.56), location: 0.08),
                    Gradient.Stop(color: Color(red: 0.88, green: 0.52, blue: 0.6), location: 0.40),
                    Gradient.Stop(color: Color(red: 0.75, green: 0.53, blue: 0.72), location: 0.61),
                    Gradient.Stop(color: Color(red: 0.2, green: 0.57, blue: 0.81), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0, y: 0.5),
                    endPoint: UnitPoint(x: 1, y: 0.5)))
            
            Text("Add to pack")
                .foregroundStyle(.white)
                .font(.system(size: 25))
                .fontWeight(.bold)
        }
    }
}
struct AddPackButton: View {
    var body: some View {
            HStack {
                Image(systemName: "plus")
                Text("Add pack")
            }
            .foregroundStyle(.white)
            .font(.system(size: 22))
            .fontDesign(.rounded)
            .fontWeight(.semibold)
            .padding(.horizontal, 115)
            .padding(.vertical, 16)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

struct HelpButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: .infinity, height: 50)
                .foregroundStyle(Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0.5))
            HStack {
                Image(systemName: "book.and.wrench.fill")
                Text("How to add and save Emojis?")
            }.padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
    }
}

struct SaveButtons: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.down")
                Text("Save to Photos")
            }
            .foregroundStyle(.white)
            .font(.system(size: 22))
            .fontDesign(.rounded)
            .fontWeight(.bold)
            .padding(.horizontal, 28)
            .padding(.vertical, 16)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            
            HStack {
                Image(systemName: "arrow.down")
                Text("Download whole pack")
                
            }
            .font(.system(size: 17))
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .foregroundStyle(.white.opacity(0.5))
            .padding(.vertical, 3)
        }
    }
}
struct RoundButton: View {
    var iconName = "gearshape.fill"
    var offSet: CGFloat = 0
    var iconSize: CGFloat = 21
    var circleDiameter: CGFloat = 40
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: circleDiameter, height: circleDiameter)
                .foregroundColor(.clear)
                .background(Color(red: 0.76, green: 0.76, blue: 0.76).opacity(0.5))
                .cornerRadius(100)
                .blur(radius: 0)
                .padding()
            
            Image(systemName: iconName)
                .font(.system(size: iconSize))
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .padding(.bottom, offSet)
        }
    }
}

struct UpgradeButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 340, height: 70)
                .foregroundStyle(Color.white)
            
            Text("Upgrade to Pro")
                .foregroundStyle(
                    LinearGradient(colors: [Color(red: 1, green: 0.7, blue: 0.22), Color(red: 0.86, green: 0.53, blue: 0.6), Color(red: 0.18, green: 0.57, blue: 0.81)], startPoint: .leading, endPoint: .trailing)
                )
                .font(.system(size: 25))
                .fontWeight(.bold)
        }
    }
}

