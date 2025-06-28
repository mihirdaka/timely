//
//  AppTheme.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import SwiftUI

enum AppTheme {
    static var primaryColor: Color {
        Color("PrimaryColor") // from Assets.xcassets
    }

    

    static var cornerRadius: CGFloat = 12

    static func font(_ style: Font.TextStyle) -> Font {
        return Font.system(style)
    }

    // Light or dark mode detection (if needed)
    static func isDarkMode(_ colorScheme: ColorScheme) -> Bool {
        colorScheme == .dark
    }
}
