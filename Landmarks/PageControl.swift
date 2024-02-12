//
//  PageControl.swift
//  Landmarks
//
//  Created by Joy Banerjee on 12/02/24.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(numberOfPages: 0, currentPage: .constant(0))
    }
}
