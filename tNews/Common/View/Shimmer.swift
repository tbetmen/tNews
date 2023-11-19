//
//  Shimmer.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import SwiftUI

struct Shimmer: View {
    @State private var opacity: Double = 0.25
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.codGray.opacity(0.5))
            .opacity(self.opacity)
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true), value: opacity)
            .onAppear { opacity = 1 }
    }
}

#Preview {
    ZStack {
        Color.white.edgesIgnoringSafeArea(.all)
        VStack {
            Shimmer()
                .frame(width: 100, height: 100)

            Shimmer()
                .frame(height: 20)

            Shimmer()
                .frame(height: 20)

            Shimmer()
                .frame(height: 100)
        }
        .padding()

    }
}
