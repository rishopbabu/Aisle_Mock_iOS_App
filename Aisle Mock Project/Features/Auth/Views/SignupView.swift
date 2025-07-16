//
//  ContentView.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 16/07/25.
//

import SwiftUI

struct SignupView: View {
    @State private var countryCode: String = "+91"
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 40)
            
            Text("Get OTP")
                .font(.title3)
                .fontWeight(.regular)
            
            Text("Enter Your \nPhone Number")
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(.black)
            
            HStack(spacing: 12) {
                TextField("", text: $countryCode)
                    .fontWeight(.bold)
                    .keyboardType(.phonePad)
                    .padding()
                    .frame(width: 80, height: 40)
                    .background(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    }
                
                TextField("Phone Number", text: $phoneNumber)
                    .fontWeight(.bold)
                    .keyboardType(.phonePad)
                    .padding()
                    .frame(height: 40)
                    .background(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    }
            }
            
            Button(action: {
                // Continue action
            }) {
                Text("Continue")
                    .fontWeight(.bold)
                    .frame(width: 140, height: 55)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    SignupView()
}

