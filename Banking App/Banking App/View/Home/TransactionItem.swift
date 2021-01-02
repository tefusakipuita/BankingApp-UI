//
//  TransactionItem.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct TransactionItem: View {
    
    // MARK: - Property
    
    let transaction: Transaction
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (alignment: .top, spacing: 22) {
                // MARK: - Image
                ZStack {
                    Circle()
                        .fill(Color.thinColor.opacity(0.3))
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "applelogo")
                        .foregroundColor(.whiteColor)
                        .font(.system(size: 24))
                } //: ZStack
                
                VStack {
                    HStack {
                        // MARK:- Info
                        VStack (alignment: .leading, spacing: 4) {
                            Text(transaction.service)
                                .foregroundColor(.whiteColor)
                            
                            Text(transaction.type)
                                .foregroundColor(.thinColor)
                                .font(.system(size: 13))
                        } //: VStack
                        
                        Spacer()
                        
                        // MARK: - Expence & Date
                        VStack (alignment: .trailing, spacing: 4) {
                            Text("-\(String(format: "%.2f", transaction.amount)) USD")
                                .foregroundColor(.whiteColor)
                            
                            
                            Text(transaction.time)
                                .foregroundColor(.thinColor)
                                .font(.system(size: 13))
                        } //: VStack
                    } //: HStack
                    
                    Rectangle()
                        .fill(Color.thinColor)
                        .frame(height: 0.5)
                        .padding(.top, 12)
                } //: VStack
                
            } //: HStack
        .padding(.top, 14)
    }
}

// MARK: - Preview

struct TransactionItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
