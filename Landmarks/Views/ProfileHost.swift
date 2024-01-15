//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Joy Banerjee on 12/01/24.
//

import SwiftUI

struct ProfileHost: View {
    
    @EnvironmentObject var editMode: EditMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
            
            ProfileSummary(profile: modelData.profile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
