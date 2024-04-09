//
//  FavouriteButtonView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 04/04/24.
//

import SwiftUI

struct FavouriteButtonView: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .blue: .gray)
        }
    }
}

#Preview {
    FavouriteButtonView(isSet: .constant(true))
}


