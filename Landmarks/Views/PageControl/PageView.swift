//
//  PageView.swift
//  Landmarks
//
//  Created by Joy Banerjee on 09/02/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            PageViewController(pages: pages, currentPage: $currentPage)

            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        })
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map({ landmark in
            FeatureCard(landmark: landmark)
        }))
    }
}
