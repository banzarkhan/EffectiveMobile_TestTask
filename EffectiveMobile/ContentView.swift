//
//  ContentView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 04/04/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    var favoritesOnly: Bool = true
    
    var filteredVacancies: [Vacancy] {
        modelData.vacancies.filter { vacancy in (!favoritesOnly || vacancy.isFavorite)
        }
    }
    
    @State var isStartViewOpened = true
    
    var body: some View {
        NavigationStack{
            TabView {
                // Tab 1
                if isStartViewOpened {
                    StartView(isStartViewIsOpened: $isStartViewOpened)
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Поиск")
                        }
                } else {
                    MainView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Поиск")
                        }
                }
                // Tab 2
                if isStartViewOpened {
                    StartView(isStartViewIsOpened: $isStartViewOpened)
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Избранное")
                        }
                } else {
                    FavouriteVacanciesView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Избранное")
                        }
                        .badge(filteredVacancies.count)
                }
                
                // Tab 3
                if isStartViewOpened {
                    StartView(isStartViewIsOpened: $isStartViewOpened)
                        .tabItem {
                            Image(systemName: "envelope")
                            Text("Отклики")
                        }
                } else {
                    Text("Отклики")
                        .tabItem {
                            Image(systemName: "envelope")
                            Text("Отклики")
                        }
                }
                // Tab 4
                if isStartViewOpened {
                    StartView(isStartViewIsOpened: $isStartViewOpened)
                        .tabItem {
                            Image(systemName: "message")
                            Text("Сообщения")
                        }
                } else {
                    Text("Сообщения")
                        .tabItem {
                            Image(systemName: "message")
                            Text("Сообщения")
                        }
                }
                // Tab 5
                if isStartViewOpened {
                    StartView(isStartViewIsOpened: $isStartViewOpened)
                        .tabItem {
                            Image(systemName: "person")
                            Text("Профиль")
                        }
                } else {
                    Text("Профиль")
                        .tabItem {
                            Image(systemName: "person")
                            Text("Профиль")
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
