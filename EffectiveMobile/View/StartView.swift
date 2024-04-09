//
//  StartView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 08/04/24.
//

import SwiftUI

struct StartView: View {
    @State var isViewOpened: Bool = false
    @State var email: String = ""
    
    @Binding var isStartViewIsOpened: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Вход в личный кабинет")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            ZStack {
                VStack(alignment: .leading) {
                    Text("Поиск работы")
                    EmailValidationView(email: $email, isViewOpened: $isViewOpened, isStartViewIsOpened: $isStartViewIsOpened)
                }
                .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.basicGrey1)
            )
            ZStack {
                VStack(alignment: .leading) {
                    Text("Поиск cотрудников")
                    Text("Размещение вакансий и доступ к базе резюме")
                    Button {
                        ///
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                .frame(height: 50)
                                .foregroundStyle(.specialGreen)
                                .padding()
                            Text("Я ищу сотрудников")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.basicGrey1)
            )
            Spacer()
        }
        .fullScreenCover(isPresented: $isViewOpened) {
            OTPView(email: email, isStartViewIsOpened: $isStartViewIsOpened)
        }
    }
}

#Preview {
    StartView(isStartViewIsOpened: .constant(true))
}
