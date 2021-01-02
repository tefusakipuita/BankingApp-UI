//
//  CardView.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Property
    
    let card: Card
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.cardGradient)
                .shadow(color: Color.darkShadow, radius: 10, x: 10, y: 10)
                .shadow(color: Color.lightShadow, radius: 10, x: -6, y: -6)

            VStack {
                // MARK: - Card Info
                HStack (alignment: .top) {
                    VStack (alignment: .leading, spacing: 8) {
                        Text(card.company.uppercased())
                            .font(.system(size: 14, weight: .bold))
                            .kerning(2)
                        
                        Text(card.type.rawValue.uppercased())
                            .font(.system(size: 14, weight: .bold))
                            .kerning(2)
                    } //: VStack
                    
                    Spacer()
                    
                    Text("Visa".uppercased())
                        .italic()
                        .font(.system(size: 24, weight: .heavy, design: .serif))
                        .kerning(2)
                } //: HStack
                
                Spacer()
                
                // MARK: - Card Number
                HStack (spacing: 12) {
                    ForEach(0..<3) { _ in
                        Text("****")
                            .kerning(3)
                    }
                    
                    Text(card.getLastForDigit())
                        .kerning(3)
                    
                    Spacer()
                } //: HStack
                .font(.system(size: 18, weight: .semibold))
            } //: VStack
            .foregroundColor(.white)
            .padding(38)
        } //: ZStack
        .frame(width: CGFloat.cardWidth, height: CGFloat.cardHeight)
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
