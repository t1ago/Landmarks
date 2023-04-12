//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Tiago Henrique Piantavinha on 04/04/23.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .cornerRadius(10)
                .frame(width: 155, height: 155)
                .padding(.bottom, 10)
            
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var modelData = ModelData()
    static var previews: some View {
        CategoryItem(landmark: modelData.landmarks[0])
    }
}
