//
//  ExpenceGraphView.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct ExpenceGraphView: View {
    
    // MARK: - Property
    
    @State var selectedIndex = -1
    
    @State var appearAnimation = false
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            ZStack (alignment: .bottom) {
                // MARK: - Rular Line
                VStack {
                    ForEach(0..<3) { _ in
                        breakLineShape()
                            .stroke(Color.whiteColor, style: StrokeStyle(lineWidth: 0.5, dash: [7, 3]))
                    }
                    breakLineShape()
                        .stroke(Color.whiteColor, lineWidth: 0.5)
                } //: VStack
                
                // MARK: - Graph
                LineShape()
                    .trim(from: 0, to: appearAnimation ? 1: 0)
                    .stroke(lineWidth: 4)
                    .fill(Color.lineGradient)
                    .frame(height: 150)
                    .animation(Animation.spring().speed(0.5).delay(1.7))
                
                HStack (alignment: .bottom) {
                    ForEach(0..<Data.expences.count) { i in
                        ZStack (alignment: .bottom) {
                            VStack (spacing: 26) {
                                // MARK: - Expence Value
                                ZStack {
                                    Capsule()
                                        .fill(Color.thinColor.opacity(0.3))
                                        .frame(height: 28)
                                        .scaleEffect(1.2)
                                        
                                    Text("$ \(String(format: "%.2f", Data.expences[i].amount))")
                                        .foregroundColor(.whiteColor)
                                        .font(.system(size: 12))
                                } //: ZStack
                                .opacity(selectedIndex == i ? 1 : 0)
                                
                                // MARK: - Tap Range
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(stops: [
                                                .init(color: Color.thinColor.opacity(0.001), location: 0.1),
                                                .init(color: Color.thinColor.opacity(selectedIndex == i ? 0.5 : 0.2), location: 1)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom)
                                    )
                                    .frame(height: 150 * Data.expences[i].amount / 600)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedIndex = i
                                        }
                                    }
                            } //: VStack
                            
                            // MARK: - Bottom Selected Bar
                            Rectangle()
                                .fill(Color.lineGradient)
                                .frame(height: 3)
                                .opacity(selectedIndex == i ? 1 : 0)
                        } //: ZStack
                    } //: ForEach
                } //: HStack
                
            }//: ZStack
            .frame(height: 200)
            
            // MARK: - Month
            HStack {
                ForEach(Data.expences) { expence in
                    Text(expence.month)
                        .foregroundColor(.thinColor)
                    
                    if let index = Data.expences.firstIndex(where: { $0.id == expence.id }) {
                        if index != Data.expences.count - 1 {
                            Spacer()
                        }
                    }
                } //: ForEach
            } //: HStack
            .padding(.top, 8)
            .padding(.horizontal, 16)
            
        } //: VStack
        .opacity(appearAnimation ? 1 : 0)
        .animation(.linear(duration: 1))
        .onAppear {
            withAnimation {
                appearAnimation = true
            }
        }
    }
}

// MARK: - Preview

struct ExpenceGraphView_Previews: PreviewProvider {
    static let card = Data.cards[0]
    @State static var showDetail = false
    
    static var previews: some View {
        CardDetailView(card: card, showDetail: $showDetail)
    }
}

