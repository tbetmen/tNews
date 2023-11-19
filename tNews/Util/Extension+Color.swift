//
//  Extension+Color.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import SwiftUI

extension Color {
    
    init(hex: UInt32, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    public static let codGray = Color(hex: 0x121212)
    public static let doveGray = Color(hex: 0x616161)
    public static let mercury = Color(hex: 0xE5E5E5)
}
