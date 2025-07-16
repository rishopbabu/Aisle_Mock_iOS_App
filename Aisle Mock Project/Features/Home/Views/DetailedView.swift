//
//  DetailedView.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 17/07/25.
//

import SwiftUI

struct DetailedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(spacing: 4) {
                Text ("Notes")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.black)
                
                Text("Personal message to you")
                    .font(.system(size: 16))
                    .foregroundStyle(.black.opacity(0.7))
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 24)
            
            
            // Featured Note
            ZStack(alignment: .bottomLeading) {
                Image("meena")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 280)
                    .clipped()
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text("Meena, 23")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    Text("Tap to review 50+ notes")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                .padding()
            }
            .padding(.horizontal)
            
            // Interested In You
            HStack {
                VStack(alignment: .leading) {
                    Text("Interested In You")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("Premium members can\nview all their likes at once")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    debugPrint("Upgrade button pressed")
                }) {
                    Text("Upgrade")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.yellow)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            // Interested Users
            HStack(spacing: 25) {
                ForEach(["teena", "beena"], id: \.self) { name in
                    VStack(alignment: .leading) {
                        Image(name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 230)
                            .clipped()
                            .cornerRadius(16)
                        
                        Text(name.capitalized)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                            .padding(.bottom, 8)
                            .cornerRadius(12)
                            .offset(y: -40)
                    }
                    .frame(width: 150, height: 200)
                    .padding(.top, 30)
                    .padding(.bottom, -20)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            CustomTabBar()
        }
        .background(Color.white.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DetailedView()
}
