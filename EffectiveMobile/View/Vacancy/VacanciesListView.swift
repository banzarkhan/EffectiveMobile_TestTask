//
//  VacanciesListView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 05/04/24.
//

import SwiftUI

struct VacanciesListView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showAllVacancies = false
    @State var showFavoritesOnly = false
    
    var displayedVacancies: [Vacancy] {
        showAllVacancies ? modelData.vacancies : Array(modelData.vacancies.prefix(3))
    }
    
    var filteredVacancies: [Vacancy] {
        modelData.vacancies.filter { vacancy in (!showFavoritesOnly || vacancy.isFavorite)
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                ForEach(showFavoritesOnly ? filteredVacancies : displayedVacancies) { vacancy in
                    VacancyCardView(vacancy: vacancy)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.basicGrey1)
                        )
                        .padding(.horizontal)
                }
            }
            
            if !showFavoritesOnly {
                if !showAllVacancies {
                    Button {
                        //                
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.specialBlue)
                                .frame(width: 330, height: 48)
                            Text(declineVacancy(number: modelData.vacancies.count - 3))
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    VacanciesListView()
//}

extension VacanciesListView {
    
    func declineVacancy(number: Int) -> String {
        let suffix: String
        if number % 10 == 1 && number != 11 {
            suffix = "я"
        } else if (2...4).contains(number % 10) && !(12...14).contains(number) {
            suffix = "и"
        } else {
            suffix = "й"
        }
        return "\(number) ваканси\(suffix)"
    }
}
