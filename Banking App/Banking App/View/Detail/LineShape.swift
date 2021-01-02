//
//  LineShape.swift
//  Banking App
//
//  Created by 中筋淳朗 on 2020/12/12.
//

import SwiftUI

struct LineShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        var x: CGFloat = 30
        var y: CGFloat = 150 - Data.expences[0].amount / 4
        
        var previousPoint = CGPoint(x: x, y: y)
        
        path.move(to: CGPoint(x: x, y: y))
        
        x += 63
        
        for i in 1..<Data.expences.count {
            y = 150 - Data.expences[i].amount / 4
            
            let currentPoint = CGPoint(x: x, y: y)
            
            path.addCurve(to: currentPoint,
                          control1: CGPoint(x: previousPoint.x + 22, y: previousPoint.y),
                          control2: CGPoint(x: currentPoint.x - 22, y: currentPoint.y))
            
            previousPoint = currentPoint
            
            x += 63
        }
        
        return path
    }
}

