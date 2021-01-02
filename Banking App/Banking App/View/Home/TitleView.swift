//
//  TitleView.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct TitleView: View {
    
    // MARK: - Property
    
    var title: String
    
    var imageName: String
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24, weight: .semibold))
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: imageName)
                    .font(.system(size: 20))
            }) //: Button
        } //: HStack
        .foregroundColor(.whiteColor)
    }
}

// MARK: - Preview

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
