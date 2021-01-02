//
//  Card.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct Card: Identifiable {
    
    // MARK: - Property
    
    let id: Int
    let number: String
    let type: CardType
    let company: String
    
    
    // MARK: - Function
    
    func getLastForDigit() -> String {
        return String(number.suffix(4)) // カード番号の末尾4文字を取得する
    }
}
