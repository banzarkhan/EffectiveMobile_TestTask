//
//  OfferView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 05/04/24.
//

import SwiftUI

struct OfferView: View {
    var offer: Offer
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading){
                Image(systemName: offer.icon)
            }
            Spacer()
            VStack(alignment: .leading) {
                
                Text(offer.title)
                if offer.button != nil {
                    Button(offer.button?.text ?? ""){
                        ///
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    OfferView(offer: Offer(id: "near_vacancies", icon: "mappin.and.ellipse", title: "Вакансии рядом с вами", button: ButtonLink(text: "TEXT"), link: "https://hh.ru/"))
}
