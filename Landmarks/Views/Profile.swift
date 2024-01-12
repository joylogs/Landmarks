//
//  Profile.swift
//  Landmarks
//
//  Created by Joy Banerjee on 12/01/24.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications: Bool = true
    
    var seasonalPhoto = Season.winter
    
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, Identifiable, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "🌨"
        
        var id: String { rawValue }
    }
    
}
