//
//  CustomTabBar.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 17/07/25.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack {
            TabBarItem(icon: "square.grid.2x2", label: "Discover")
            TabBarItem(icon: "envelope.fill", label: "Notes", badge: "9")
            TabBarItem(icon: "bubble.left.and.bubble.right.fill", label: "Matches", badge: "50+")
            TabBarItem(icon: "person", label: "Profile")
        }
        .padding(.vertical, 5)
        .background(Color.white.shadow(radius: 4))
    }
}

struct TabBarItem: View {
    let icon: String
    let label: String
    var badge: String? = nil

    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                if let badge = badge {
                    Text(badge)
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.purple)
                        .clipShape(Capsule())
                        .offset(x: 10, y: -10)
                }
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CustomTabBar()
}
