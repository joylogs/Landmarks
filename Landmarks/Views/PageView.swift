//
//  PageView.swift
//  Landmarks
//
//  Created by Joy Banerjee on 09/02/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    var body: some View {
        PageViewController(pages: pages)
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
