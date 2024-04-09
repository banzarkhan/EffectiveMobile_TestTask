//
//  EmailValidationView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 08/04/24.
//

import SwiftUI

struct EmailValidationView: View {
    @ObservedObject var emailValidationVM = EmailValidationViewModel()
    
    @Binding var email: String
    @State private var isValidEmail: Bool = false
    @Binding var isViewOpened: Bool
    @Binding var isStartViewIsOpened: Bool
    
    @State var isTypingFinished: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "envelope")
                    .foregroundStyle(.basicGrey3)
                TextField("Электронная почта", text: $email, onCommit: {
                    isValidEmail = emailValidationVM.isValidEmailAddress(email: email)
                    isTypingFinished = true
                    self.email = email
                  })
                    .padding()
                    .autocapitalization(.none)
                    
                if !email.isEmpty {
                    Button(action: {
                        self.email = ""
                        isTypingFinished = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundStyle(.basicGrey3)
                    }
                    .padding(.trailing, 8)
                }
            }
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.basicGrey2)
            )
            
            HStack{
                Button(action: {
                    
                    if self.isValidEmail {
                        isViewOpened = true
                        print("Valid email. Proceed to next screen.")
                    } else {
                        print("Invalid email. Please enter a valid email address.")
                    }
                }) {
                    Text("Продолжить")
                        .padding()
                        .foregroundColor(.white)
                        .background(self.email.isEmpty || !isValidEmail ? Color.specialDarkBlue : Color.specialBlue)
                        .cornerRadius(8)
                }
                .disabled(self.email.isEmpty)
                
                Button("Войти с паролем"){
                    ///
                }
            }
            .padding(.vertical)
            
            if isTypingFinished {
                if !isValidEmail && !email.isEmpty {
                    Text("Вы ввели неверный e-mail")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

//#Preview {
//    EmailValidationView(email: "example@mail.ru", isViewOpened: .constant(false), isStartViewIsOpened: .constant(true))
//}
