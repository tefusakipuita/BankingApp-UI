//
//  breakLineShape.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct breakLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        
        return path
    }
}
