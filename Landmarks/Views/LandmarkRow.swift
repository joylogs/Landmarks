//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Joy Banerjee on 03/01/24.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

//struct Turtle_Rock: PreviewProvider {
//    static var previews: some View {
//        LandmarkRow(landmark: landmarks[0])
//    }
//}
//
//
//struct Silver_Salmon_Creek: PreviewProvider {
//    static var previews: some View {
//        LandmarkRow(landmark: landmarks[1])
//    }
//}

struct LandMarkRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        LandmarkRow(landmark: landmarks[0])
    }
}
