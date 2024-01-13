//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Joy Banerjee on 12/01/24.
//

import SwiftUI

struct ProfileHost: View {
    
    private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
