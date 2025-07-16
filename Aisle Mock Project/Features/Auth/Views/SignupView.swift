//
//  ContentView.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 16/07/25.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Spacer().frame(height: 40)
                
                Text("Get OTP")
                    .font(.title3)
                    .fontWeight(.regular)
                
                Text("Enter Your \nPhone Number")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.black)
                
                HStack(spacing: 12) {
                    TextField("", text: $viewModel.countryCode)
                        .fontWeight(.bold)
                        .keyboardType(.phonePad)
                        .padding()
                        .frame(width: 80, height: 40)
                        .background(Color.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        }
                    
                    TextField("Phone Number", text: $viewModel.phoneNumber)
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
                    viewModel.requestOTP()
                }) {
                    Text("Continue")
                        .fontWeight(.bold)
                        .frame(width: 140, height: 55)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }
                .disabled(viewModel.phoneNumber.isEmpty)
                
                Spacer()
                
                NavigationLink(destination: OTPScreen(phoneWithCode: viewModel.fullPhoneNumber), isActive: $viewModel.navigateToOTP, label: { EmptyView() })
            }
            .padding(.horizontal, 24)
            .background(Color.white.ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SignupView()
}

