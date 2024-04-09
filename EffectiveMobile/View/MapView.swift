//
//  MapView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 06/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var body: some View {
        Map {
            Marker("", systemImage: "briefcase", coordinate: .minsk)
        }
    }
}

#Preview {
    MapView()
}

extension CLLocationCoordinate2D {
    static let minsk = CLLocationCoordinate2D(latitude: 53.89300, longitude: 27.56744)
}
