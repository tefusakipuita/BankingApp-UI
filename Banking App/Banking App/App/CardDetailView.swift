//
//  CardDetailView.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct CardDetailView: View {
    
    // MARK: - Property
    
    let card: Card
    
    @Binding var showDetail: Bool
    
    @State var appearAnimation = false
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
                
            // MARK: - Background
            Color.backgroundGradient
                .edgesIgnoringSafeArea(.all)
                .opacity(appearAnimation ? 1 : 0)
                .animation(appearAnimation ? nil : Animation.easeOut(duration: 0.4).delay(0.8))
            
            VStack {
                
                // MARK: - Top Bar
                HStack {
                    Button(action: {
                        withAnimation {
                            appearAnimation  = false
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                            showDetail = false
                        }
                    }, label: {
                        Image(systemName: "multiply")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.trailing, 20)
                    }) //: Button
                    
                    Text("Card Details")
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "slider.vertical.3")
                            .font(.system(size: 24, weight: .bold))
                    }) //: Button
                } //: HStack
                .foregroundColor(.whiteColor)
                .padding(.top)
                .padding(.horizontal, 20)
                .opacity(appearAnimation ? 1 : 0)
                .animation(appearAnimation ? nil : Animation.easeOut(duration: 0.6).delay(0.8))
                
                ZStack {
                    // MARK: - Card
                    CardView(card: card)
                        .rotationEffect(Angle(degrees: appearAnimation ? 90 : 0))
                        .offset(x: appearAnimation ? -UIScreen.screenWidth / 2 : 0,
                                y: appearAnimation ? 0 : -CGFloat.cardHeight / 2 + 7)
                        .animation(Animation.easeIn(duration: 0.7))
                    
                    // MARK: - Info
                    DetailInfoView()
                        .frame(width: UIScreen.screenWidth - CGFloat.cardHeight/2 - 80, alignment: .leading)
                        .padding(.leading, CGFloat.cardHeight/2 + 40)
                        .opacity(appearAnimation ? 1 : 0)
                        .offset(x: appearAnimation ? 0 : -6, y: appearAnimation ? 0 : 6)
                        .animation(appearAnimation ? Animation.easeOut(duration: 0.6).delay(0.9) : nil)
                } //: ZStack
                .padding(.top, CGFloat.cardHeight / 2)
                
                // MARK: - Expence Graph
                Group {
                    TitleView(title: "Expences", imageName: "ellipsis")
                        .padding(.horizontal, 20)
                        .padding(.top, 70)
                        .opacity(appearAnimation ? 1 : 0)
                        .animation(appearAnimation ? .linear(duration: 1) : nil)
                    
                    ExpenceGraphView()
                        .padding(.horizontal, 20)
                } //: Group
                .opacity(appearAnimation ? 1 : 0)
                .animation(appearAnimation ? nil : Animation.easeOut(duration: 0.7))
                
                Spacer()
            } //: VStack
        } //: ZStack
        .onAppear {
            withAnimation {
                appearAnimation = true
            }
        }
    }
}

// MARK: - Preview

struct CardDetailView_Previews: PreviewProvider {
    static let card = Data.cards[0]
    @State static var showDetail = false
    
    static var previews: some View {
        CardDetailView(card: card, showDetail: $showDetail)
    }
}
