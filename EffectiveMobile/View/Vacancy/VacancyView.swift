//
//  VacancyView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 05/04/24.
//

import SwiftUI

struct VacancyView: View {
    @EnvironmentObject var modelData: ModelData
    var vacancy: Vacancy
    
    var vacancyIndex: Int {
        modelData.vacancies.firstIndex(where: { $0.id == vacancy.id })!
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(vacancy.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text(vacancy.salary.full)
                    Text("Требуемый опыт: \(vacancy.experience.text)")
                    Text(vacancy.formattedSchedules)
                    HStack {
                        if vacancy.appliedNumber != nil {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.specialDarkGreen)
                                    .frame(height: 60)
                                
                                Text("\(declinePeople(number: vacancy.appliedNumber ?? 0)) уже откликнулись")
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .padding()
                            }
                        }
                        if vacancy.lookingNumber != nil {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.specialDarkGreen)
                                    .frame(height: 60)
                                Text("\(declinePeople(number: vacancy.lookingNumber ?? 0)) сейчас смотрят")
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .padding()
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(vacancy.company)
                            Image(systemName: "checkmark.circle")
                        }
                        MapView()
                            .frame(height: 58)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.basicGrey1)
                    )
                    .padding(.vertical)
                    if vacancy.description != nil {
                        Text(vacancy.description ?? "")
                    }
                    Text("Ваши задачи")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    Text(vacancy.responsibilities)
                    Text("Задайте вопрос работадателю")
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("Он его получит вместе с откликом")
                        .foregroundStyle(.basicGrey3)
                    ForEach(vacancy.questions, id: \.self) { question in
                        Text(question)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .foregroundStyle(.basicGrey1)
                            )
                    }
                    Button {
                        ///
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.specialGreen)
                                .frame(height: 48)
                            Text("Откликнуться")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .font(.system(size: 14))
                .padding()
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Image(systemName: "eye")
                        .foregroundStyle(.white)
                    Image(systemName: "square.and.arrow.up")
                    FavouriteButtonView(isSet: $modelData.vacancies[vacancyIndex].isFavorite)
                }
            }
        }
    }
}

struct VacancyView_Previews:
    PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        VacancyView(vacancy: modelData.vacancies[0])
            .environmentObject(modelData)
    }
}

extension VacancyView {
    
    func declinePeople(number: Int) -> String {
        let suffix: String = (2...4).contains(number % 10) ? "а" : ""
        return "\(number) человек\(suffix)"
    }
}
