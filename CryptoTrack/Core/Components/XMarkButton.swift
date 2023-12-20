//
//  XMarkButton.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 20.12.2023.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
        }
    }
}

#Preview {
    XMarkButton()
}
