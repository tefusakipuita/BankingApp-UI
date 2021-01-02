//
//  Transaction.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

// 取引？
struct Transaction: Identifiable {
    
    let id = UUID()
    let date: String
    let time: String
    let company: String
    let service: String
    let card: String
    let amount: CGFloat
    let type: String
}
