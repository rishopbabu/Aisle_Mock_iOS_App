//
//  OTPScreen.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 16/07/25.
//

import SwiftUI

struct OtpView: View {
    @State private var otp: String = ""
    @State private var timer: Int = 59
    @State private var phoneNumber: String = "+91 9999999999"
    @State private var timerRunning = true
    
    let timerInterval = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Spacer().frame(height: 40)
            
            HStack {
                Text(phoneNumber)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Button {
                    //
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
            
            TextField("0000", text: $otp)
                .fontWeight(.bold)
                .keyboardType(.phonePad)
                .padding()
                .frame(width: 100,height: 40)
                .background(Color.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                }
            
            HStack(spacing: 10) {
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
                
                Text("00:\(String(format: "%02d", timer))")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .onReceive(timerInterval) { _ in
            if timerRunning && timer > 0 {
                timer -= 1
            }
        }
    }
}

#Preview {
    OtpView()
}
