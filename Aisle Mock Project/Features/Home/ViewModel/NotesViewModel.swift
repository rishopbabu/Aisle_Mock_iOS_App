//
//  NotesViewModel.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 17/07/25.
//

import Foundation
import SwiftUI

class NotesViewModel: ObservableObject {
    @Published var loginResponse: LoginAPIResponse?
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false

    func fetchNotes() {
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            self.isError = true
            return
        }

        isLoading = true
        NetworkManager.shared.request(urlString: APIServices.notesAPI, method: .get, parameters: nil, authorizationToken: token) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data):
                    do {
                        let response = try JSONDecoder().decode(LoginAPIResponse.self, from: data)
                        debugPrint(response)
                    } catch {
                        self.isError = true
                    }
                case .failure:
                    self.isError = true
                }
            }
        }
    }
}
