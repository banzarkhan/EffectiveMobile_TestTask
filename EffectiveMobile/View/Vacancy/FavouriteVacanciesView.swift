//
//  FavouriteVacanciesView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 06/04/24.
//

import SwiftUI

struct FavouriteVacanciesView: View {
    @EnvironmentObject var modelData: ModelData
    private var showFavoritesOnly: Bool = true
    
    var filteredVacancies: [Vacancy] {
        modelData.vacancies.filter { vacancy in (!showFavoritesOnly || vacancy.isFavorite)
        }
    }
    
    var body: some View {
        ScrollView{
            HStack{
                Text("Избранное")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            HStack{
                Text(declineVacancy(number: filteredVacancies.count))
                Spacer()
            }
            .padding(.horizontal)
            VacanciesListView(showFavoritesOnly: showFavoritesOnly)
        }
    }
}

#Preview {
    FavouriteVacanciesView()
        .environmentObject(ModelData())
}

extension FavouriteVacanciesView {
    
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
