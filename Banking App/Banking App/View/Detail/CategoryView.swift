//
//  CategoryView.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct CategoryView: View {
    
    // MARK: - Property
    
    let imageName: String
    
    let title: String
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: imageName)
                .foregroundColor(.thinColor)
                .font(.system(size: 20))
                .rotationEffect(Angle(degrees: imageName == "wifi" ? 90 : 0))
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(.whiteColor)
                .font(.system(size: 18, weight: .semibold))
        } //: HStack
    }
}

// MARK: - Preview

struct CategoryView_Previews: PreviewProvider {
    static let card = Data.cards[0]
    @State static var showDetail = false
    
    static var previews: some View {
        CardDetailView(card: card, showDetail: $showDetail)
    }
}
