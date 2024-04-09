//
//  EmailValidationViewModel.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 09/04/24.
//

import Foundation

class EmailValidationViewModel: ObservableObject {
    
    func isValidEmailAddress(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
