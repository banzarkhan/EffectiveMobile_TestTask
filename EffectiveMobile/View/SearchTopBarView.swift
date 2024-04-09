//
//  SearchTopBarView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 06/04/24.
//

import SwiftUI

struct SearchTopBarView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.basicGrey1)
                    .frame(height: 40)
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Должность, ключевые слова")
                        .font(.system(size: 14))
                        .foregroundStyle(.basicGrey3)
                    Spacer()
                }
                .padding()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.basicGrey1)
                    .frame(width:40, height: 40)
                Image(systemName: "slider.horizontal.3")
            }
        }
    }
}

#Preview {
    SearchTopBarView()
}
