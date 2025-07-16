//
//  SignUpViewModel.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 17/07/25.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var countryCode: String = "+91"
    @Published var phoneNumber: String = "9876543212"
    @Published var isLoading = false
    @Published var navigateToOTP = false
    @Published var fullPhoneNumber = ""
    @Published var authResponse: PhoneNumberAPIResponse?
    
    func requestOTP() {
        fullPhoneNumber = "\(countryCode)\(phoneNumber)"
        isLoading = true
        
        let params = ["number": fullPhoneNumber]
        
        NetworkManager.shared.request(urlString: APIServices.phoneNumberAPI, method: .post, parameters: params, authorizationToken: nil) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data):
                    do {
                        let response = try JSONDecoder().decode(PhoneNumberAPIResponse.self, from: data)
                        self.authResponse = response
                        debugPrint(response)
                        if response.status {
                            self.navigateToOTP = true
                        } else {
                            debugPrint("Failed")
                        }
                    } catch {
                        debugPrint("Decoding error: \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    debugPrint("Network Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
