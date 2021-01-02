//
//  ContentView.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager = CardManager()
    
    @State var currentPageIndex = 0
    
    @State var showDetail = false
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.backgroundGradient
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // MARK: - Top Bar
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "equal")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.trailing, 20)
                    }) //: Button
                    
                    Text("Home")
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 24, weight: .bold))
                    }) //: Button
                } //: HStack
                .foregroundColor(.whiteColor)
                    .padding(.top)
                    .padding(.horizontal, 20)
                    .padding(.bottom, -20)
                
                // MARK: - Card View
                TabView(selection: $currentPageIndex) {
                    ForEach(manager.cardData) { card in
                        CardView(card: card)
                            .onTapGesture {
                                showDetail = true
                            }
                    } //: ForEach
                } //: TabView
                .tabViewStyle(PageTabViewStyle())
                .frame(height: CGFloat.cardHeight + 140)
                
                // MARK: - Transaction Title
                TitleView(title: "Transactions", imageName: "arrow.up.arrow.down")
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                // MARK: - Transaction List
                ScrollView {
                    LazyVStack {
                        // date(日付ごとに分割していく)
                        ForEach(manager.getUniqueDates(cardNumber: manager.cardData[currentPageIndex].number), id: \.self) { date in
                            // MARK: - Date
                            HStack {
                                Text(manager.getModifiedDate(date: date))
                                    .foregroundColor(.thinColor)
                                    .font(.system(size: 15))
                                
                                Spacer()
                            } //: HStack
                            .padding(.top, 18)
                            
                            // MARK: - Transaction
                            ForEach(manager.getTransaction(date: date, cardNumber: manager.cardData[currentPageIndex].number)) { transaction in
                                TransactionItem(transaction: transaction)
                            }
                            
                        } //: ForEach
                    } //: VStack
                    .padding(.horizontal, 20)
                } //: Scroll
                
                Spacer()
            } //: VStack
            
            // MARK: - Detail
            if showDetail {
                CardDetailView(card: manager.cardData[currentPageIndex], showDetail: $showDetail)
            }
        } //: ZStack
        .edgesIgnoringSafeArea(.bottom)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
