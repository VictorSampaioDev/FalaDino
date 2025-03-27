
//
//  SplashScreenView.swift
//  FalaDino
//
//  Created by found on 26/03/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            Color.orange.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Image("logo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            if isActive {
                HomeView()
                    .transition(.opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
