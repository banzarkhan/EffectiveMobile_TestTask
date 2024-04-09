//
//  VacancyCardView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 04/04/24.
//

import SwiftUI

struct VacancyCardView: View {
    @EnvironmentObject var modelData: ModelData
    var vacancy: Vacancy
    
    var vacancyIndex: Int {
        modelData.vacancies.firstIndex(where: { $0.id == vacancy.id })!
    }
    
    @State var isOpened: Bool = false
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    if (vacancy.lookingNumber != nil) {
                        Text(declinePeople(number: vacancy.lookingNumber ?? 0))
                            .foregroundStyle(.green)
                            .font(.system(size: 14))
                    }
                    Spacer()
                    FavouriteButtonView(isSet: $modelData.vacancies[vacancyIndex].isFavorite)
                }
                NavigationLink {
                    VacancyView(vacancy: vacancy)
                        .environmentObject(modelData)
                } label: {
                        VStack(alignment: .leading) {
                            Text(vacancy.title)
                                .font(.callout)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.leading)
                            if vacancy.salary.short != nil {
                                Text(vacancy.salary.short ?? "")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            Group{
                                Text(vacancy.address.town)
                                HStack {
                                    Text(vacancy.company)
                                    Image(systemName: "checkmark.circle")
                                        .foregroundStyle(.gray)
                                }
                                HStack {
                                    Image(systemName: "briefcase")
                                    Text(vacancy.experience.previewText)
                                }
                                Text("Опубликовано \(formattedDate(from: vacancy.publishedDate) ?? "")")
                                    .foregroundStyle(.gray)
                            }
                            .font(.system(size: 14))
                        }
                        .foregroundStyle(.white)
                }
                
                HStack {
                    Spacer()
                    Button {
                        ///
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundStyle(.specialGreen)
                                .frame(width: 296, height: 32)
                            Text("Откликнуться")
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                }
            }
            .padding()
        }
}

struct VacancyCardView_Previews:
    PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        VacancyCardView(vacancy: modelData.vacancies[1])
                    .environmentObject(modelData)
    }
}

extension VacancyCardView {
    
    func declinePeople(number: Int) -> String {
        let suffix: String = (2...4).contains(number % 10) ? "а" : ""
        return "Сейчас просматривает \(number) человек\(suffix)"
    }
    
    func formattedDate(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let day = Calendar.current.component(.day, from: date)
            let month = monthName(for: date)
            return "\(day) \(month)"
        }
        
        return nil
    }
    
    func monthName(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        return dateFormatter.string(from: date)
    }
}
