//
//  OTPViewModel.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 17/07/25.
//

import Foundation
import Combine

class OTPViewModel: ObservableObject {
    @Published var otp: String = ""
    @Published var timer: Int = 59
    @Published var timerRunning = true
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var navigateToHome = false
    
    let phoneWithCode: String
    private var cancellables = Set<AnyCancellable>()
    
    init(phoneWithCode: String) {
        self.phoneWithCode = phoneWithCode
        startTimer()
    }
    
    func startTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.timerRunning && self.timer > 0 {
                    self.timer -= 1
                }
            }
            .store(in: &cancellables)
    }
    
    func verifyOTP() {
        isLoading = true
        errorMessage = nil
        
        let params = ["number": phoneWithCode, "otp": otp]
        
        NetworkManager.shared.request(urlString: APIServices.otpAPI, method: .post, parameters: params, authorizationToken: nil) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data):
                    do {
                        let response = try JSONDecoder().decode(OTPAPIResponse.self, from: data)
                        debugPrint(response)
                        guard let token = response.token else {
                            self.errorMessage = "Invalid OTP"
                            return
                        }
                        UserDefaults.standard.set(token, forKey: "token")
                        self.navigateToHome = true
                    } catch {
                        self.errorMessage = "Invalid response from server"
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

