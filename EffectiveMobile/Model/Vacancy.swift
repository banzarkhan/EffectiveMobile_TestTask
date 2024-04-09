//
//  Vacancy.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 04/04/24.
//

import Foundation

struct Vacancy: Codable, Identifiable, Hashable {
    var id: String
    var lookingNumber: Int?
    var title: String
    var address: Address
    var company: String
    var experience: Experience
    var publishedDate: String
    var isFavorite: Bool
    var salary: Salary
    var schedules: [String]
    var appliedNumber: Int?
    var description: String?
    var responsibilities: String
    var  questions: [String]
    
    var formattedSchedules: String {
            guard let firstSchedule = schedules.first else { return "" }
            
            let formattedFirstWord = firstSchedule.prefix(1).capitalized + firstSchedule.dropFirst()
            let formattedSchedules = [formattedFirstWord] + schedules.dropFirst()
            return formattedSchedules.joined(separator: ", ")
        }
}

struct Address: Codable, Hashable {
    let town: String
    let street: String
    let house: String
}

struct Experience: Codable, Hashable {
    let previewText: String
    let text: String
}

struct Salary: Codable, Hashable {
    let short: String?
    let full: String
}
