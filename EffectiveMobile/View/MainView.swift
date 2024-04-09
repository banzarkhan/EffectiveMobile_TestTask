//
//  MainView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 05/04/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchTopBarView()
                    .padding(.horizontal)
                ScrollView(.horizontal){
                    Grid {
                        GridRow {
                            ForEach(modelData.offers) { offer in
                                OfferView(offer: offer)
                                    .frame(width: 132, height: 120)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundStyle(.basicGrey1)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                HStack {
                    Text("Вакансии для вас")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding([.top, .leading, .trailing])
                VacanciesListView()
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ModelData())
}
