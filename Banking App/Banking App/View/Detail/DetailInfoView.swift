//
//  DetailInfoView.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct DetailInfoView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            
            // MARK: - Progerss
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                    .fill(Color.thinColor.opacity(0.3))
                    .frame(width: 60, height: 60)
                
                Circle()
                    .trim(from: 0, to: 0.6)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .fill(Color.progressGradient)
                    .frame(width: 60, height: 60)
                    .rotationEffect(Angle(degrees: -90))
                
                Text("3/5")
                    .foregroundColor(.whiteColor)
                    .fontWeight(.semibold)
            } //: ZStack
            .padding(.bottom, 40)
            
            // MARK: - Money
            HStack (alignment: .bottom, spacing: 0) {
                Text("$")
                    .foregroundColor(.thinColor)
                    .font(.system(size: 28))
                    .padding(.trailing, 10)
                    .padding(.bottom, 2)
                
                Text("5,600")
                    .foregroundColor(.whiteColor)
                    .font(.system(size: 38, weight: .bold))
                
                Text(".90")
                    .foregroundColor(.thinColor)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 4)
            } //: HStack
            .padding(.bottom, 26)
            
            // MARK: - Category
            CategoryView(imageName: "creditcard.fill", title: "Bank card")
                .padding(.bottom, 10)
            CategoryView(imageName: "banknote.fill", title: "Bank account")
                .padding(.bottom, 10)
            CategoryView(imageName: "wifi", title: "Pay")
            
            // MARK: - Expence Graph
            
        } //: VStack
    }
}

// MARK: - Preview

struct DetailInfoView_Previews: PreviewProvider {
    static let card = Data.cards[0]
    @State static var showDetail = false
    
    static var previews: some View {
        CardDetailView(card: card, showDetail: $showDetail)
    }
}
