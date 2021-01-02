//
//  CardManager.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

class CardManager: ObservableObject {
    
    // MARK: - Property
    
    @Published var cardData = Data.cards
    
    // 今日の日付
    let currentDateString = "12 dec 2020"
    
    
    // MARK: - Function
    
    // カードごとに取引記録の日付を入れた配列を作る
    func getUniqueDates(cardNumber: String) -> [String] {
        var dates: [String] = []
        
        var lastDate = ""
        
        for transaction in Data.transactions {
            // 取引のカード番号と引数のカード番号が一致して、取引の日付が lastDate と異なるなら(dateの重複を防ぐ)
            if transaction.card == cardNumber && transaction.date != lastDate {
                dates.append(transaction.date)
                // lastDate の更新
                lastDate = transaction.date
            }
        }
        
        return dates
    }
    
    // 引数の date が今日の日付なら"Today", 昨日の日付なら"Yesterday"の表記にする
    func getModifiedDate(date: String) -> String {
        // デフォルトは引数で与えられる date
        var modifiedDate = date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"  // 型の指定
        
        // 文字列( currentDateString )を Date型 に変換する
        if let currentDate = dateFormatter.date(from: currentDateString) {
            // 文字列( 引数のdate )を Date型 に変換する
            if let givenDate = dateFormatter.date(from: date) {
                // 日にち(.day)を基準に 『今日の日付』と『引数の日付』の差分を割り出す (何日差分があるか)
                let difference = Calendar.current.dateComponents([.day], from: currentDate, to: givenDate)
                
                // 差分が０なら Today の表記に
                if abs(difference.day!) == 0 {
                    modifiedDate = "Today"
                }
                // 差分が１なら Yesterday の表記に
                else if abs(difference.day!) == 1 {
                    modifiedDate = "Yesterday"
                }
            }
        }
            
        return modifiedDate
    }
    
    // 引数の日付ごとに取引情報を入れた配列を作る
    func getTransaction(date: String, cardNumber: String) -> [Transaction] {
        var transactions: [Transaction] = []
        
        for transaction in Data.transactions {
            if transaction.date == date && transaction.card == cardNumber {
                transactions.append(transaction)
            }
        }
        
        return transactions
    }
}
