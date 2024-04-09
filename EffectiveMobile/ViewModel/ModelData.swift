//
//  ModelData.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 04/04/24.
//

import Foundation

class ModelData: ObservableObject {
    @Published var offers: [Offer]
    @Published var vacancies: [Vacancy]
    
    private var root: Root
    
    init() {
        self.root = load("data.json")
        self.offers = root.offers
        self.vacancies = root.vacancies
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
