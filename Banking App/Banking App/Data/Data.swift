//
//  Data.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct Data {
    
    static let cards = [
        Card(id: 0, number: "1223455622115610", type: CardType.Platinum, company: "Visa"),
        Card(id: 1, number: "1223455622114311", type: CardType.Gold, company: "Visa"),
        Card(id: 2, number: "1223455622119521", type: CardType.Silver, company: "Visa")
    ]
    
    static let transactions = [
        Transaction(date: "12 Dec 2020", time: "09: 20 AM", company: "Apple", service: "iTunes",
                    card: "1223455622115610", amount: 500, type: "Entertainment"),
        Transaction(date: "11 Dec 2020", time: "09: 20 AM", company: "Google", service: "Google Play",
                    card: "1223455622115610", amount: 450, type: "Entertainment"),
        Transaction(date: "10 Dec 2020", time: "02: 10 AM", company: "Nike", service: "Nike",
                    card: "1223455622115610", amount: 200, type: "Clothes"),
        Transaction(date: "10 Dec 2020", time: "07: 10 AM", company: "Adidas", service: "Adidas",
                    card: "1223455622115610", amount: 400, type: "Shoes"),
        Transaction(date: "10 Dec 2020", time: "06: 20 AM", company: "Amazon", service: "Prime",
                    card: "1223455622115610", amount: 100, type: "Electronics"),
        Transaction(date: "10 Dec 2020", time: "05: 30 AM", company: "Google", service: "Google Play",
                    card: "1223455622119521", amount: 500, type: "Entertainment"),
        Transaction(date: "11 Dec 2020", time: "09: 40 AM", company: "Apple", service: "iTunes",
                    card: "1223455622114311", amount: 500, type: "Entertainment")
    ]
    
    static let expences = [
        Expence(month: "Jan", amount: 350.00),
        Expence(month: "Feb", amount: 280.00),
        Expence(month: "Mar", amount: 175.00),
        Expence(month: "Apr", amount: 340.00),
        Expence(month: "May", amount: 600.00),
        Expence(month: "Jun", amount: 320.90)
    ]
}
