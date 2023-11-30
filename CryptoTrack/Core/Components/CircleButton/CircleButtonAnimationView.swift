//
//  CircleButtonAnimationView.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 30.11.2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animete: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animete ? 1.0 : 0.0)
            .opacity(animete ? 0.0 : 1.0)
            .animation(animete ? Animation.easeOut(duration: 1.0) : .none, value: animete)
    }
}

#Preview {
    CircleButtonAnimationView(animete: .constant(true))
}
