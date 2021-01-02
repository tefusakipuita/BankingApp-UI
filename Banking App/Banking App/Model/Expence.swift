//
//  Expence.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

// 費用
struct Expence: Identifiable {
    
    let id = UUID()
    let month: String
    let amount: CGFloat
}
