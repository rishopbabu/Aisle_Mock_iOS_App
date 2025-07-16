//
//  AuthModel.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 17/07/25.
//

import Foundation

struct PhoneNumberAPIResponse: Codable {
    let status: Bool
}

struct OTPAPIResponse: Codable {
    let token: String?
}

