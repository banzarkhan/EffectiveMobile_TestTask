//
//  Offer.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 04/04/24.
//

import Foundation

struct Offer: Codable, Identifiable, Hashable {
    let id: String
    let icon: String
    let title: String
    let button: ButtonLink?
    let link: String
}

struct ButtonLink: Codable, Hashable {
    let text: String
}
