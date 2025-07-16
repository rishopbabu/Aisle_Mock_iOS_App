//
//  NotesScreen.swift
//  Aisle Mock Project
//
//  Created by Rishop Babu on 16/07/25.
//

import SwiftUI

struct NotesScreen: View {
    
    @StateObject private var viewModel = NotesViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.isError {
                Text("Something went wrong")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                DetailedView()
            }
        }
        .onAppear {
            viewModel.fetchNotes()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.white.ignoresSafeArea())
        
    }
}

#Preview {
    NotesScreen()
}
