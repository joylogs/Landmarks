//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Joy Banerjee on 06/01/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        
        GeometryReader { geometryReader in
            
            Path { path in
                
                var width: CGFloat = min(geometryReader.size.width, geometryReader.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset: CGFloat = width * (1.0 - xScale) / 2.0
                
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * 0.20 + HexagonParameters.adjustment))
                
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(to: CGPoint(
                        x: width * segment.line.x,
                        y: height * segment.line.y))
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x,
                            y: height * segment.control.y
                        )
                    )
                }
                
            }
            .fill(.black)
            
        }
        
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
