//
//  UIApplication.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 12.12.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
