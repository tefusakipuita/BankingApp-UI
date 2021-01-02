//
//  Extension.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI



extension Color {
    
    static let lightBg = Color("lightBg")
    static let darkBg = Color("darkBg")
    
    static let lightShadow = Color("lightShadow")
    static let darkShadow = Color("darkShadow")
    
    static let lightOrange = Color("lightOrange")
    static let darkOrange = Color("darkOrange")
    
    static let cardLightOrange = Color("cardLightOrange")
    static let cardDarkOrange = Color("cardDarkOrange")
    
    static let whiteColor = Color("whiteColor")
    static let textColor = Color("textColor")
    static let thinColor = Color("thinColor")
    
    
    static let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.lightBg, Color.darkBg]), startPoint: .top, endPoint: .bottom)
    
    static let cardGradient = LinearGradient(gradient: Gradient(colors: [Color.cardDarkOrange, Color.cardLightOrange]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let progressGradient = LinearGradient(gradient: Gradient(colors: [Color.lightOrange, Color.darkOrange]), startPoint: .leading, endPoint: .trailing)
    
    static let lineGradient = LinearGradient(gradient: Gradient(colors: [Color.darkOrange, Color.lightOrange]), startPoint: .leading, endPoint: .trailing)
}


extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}


extension CGFloat {
    
    static let cardWidth = UIScreen.screenWidth - 80
    static let cardHeight = (UIScreen.screenWidth - 80) * 0.6
}
