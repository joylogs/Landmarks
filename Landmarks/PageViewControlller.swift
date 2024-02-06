//
//  PageViewControlller.swift
//  Landmarks
//
//  Created by Joy Banerjee on 06/02/24.
//

import Foundation

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    
    var pages: [Page]
}
