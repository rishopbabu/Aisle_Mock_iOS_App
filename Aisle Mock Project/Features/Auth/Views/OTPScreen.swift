//
//  OTPScreen.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 16/07/25.
//

import SwiftUI

struct OTPScreen: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: OTPViewModel

    init(phoneWithCode: String) {
        _viewModel = StateObject(wrappedValue: OTPViewModel(phoneWithCode: phoneWithCode))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Spacer().frame(height: 40)
            
            HStack {
                Text(viewModel.phoneWithCode)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "pencil")
                        .foregroundStyle(.black)
                        .fontWeight(.medium)
                }
                
                Spacer()
            }
            
            Text("Enter The \nOTP")
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(.black)
            
            TextField("0000", text: $viewModel.otp)
                .fontWeight(.bold)
                .keyboardType(.phonePad)
                .padding()
                .frame(width: 100, height: 40)
                .background(Color.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            HStack(spacing: 10) {
                Button(action: {
                    viewModel.verifyOTP()
                }) {
                    Text("Continue")
                        .fontWeight(.bold)
                        .frame(width: 140, height: 55)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }
                
                Text("00:\(String(format: "%02d", viewModel.timer))")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            
            Spacer()
            
            NavigationLink(destination: NotesScreen(), isActive: $viewModel.navigateToHome) {
                EmptyView()
            }
        }
        .padding(.horizontal, 20)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    OTPScreen(phoneWithCode: "+91 9876543212")
}
