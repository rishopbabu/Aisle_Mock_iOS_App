//
//  APIServices.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 16/07/25.
//

import Foundation

struct APIServices {
    static let baseURL = "https://app.aisle.co/V1"
    static let phoneNumberAPI = baseURL + "/users/phone_number_login"
    static let otpAPI = baseURL + "/users/verify_otp"
    static let notesAPI = baseURL + "/users/test_profile_list"
}
