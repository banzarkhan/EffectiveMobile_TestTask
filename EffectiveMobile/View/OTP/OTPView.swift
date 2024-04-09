//
//  OTPView.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 08/04/24.
//

import SwiftUI

struct OTPView: View {
    
    @Environment(\.dismiss) var dismiss
    
    static let codeDigits = 4
    @State
    var codeDict = Dictionary<Int, String>(uniqueKeysWithValues: (0..<codeDigits).map{ ($0, "") })
    // [0:"", 1:"", ..., 5:""]
    
    var code: String {
        codeDict.sorted(by: { $0.key < $1.key }).map(\.value).joined()
    }
    
    var isButtonDisabled: Bool {
        codeDict.values.contains(where: { $0.isEmpty })
    }
    
    @State var email: String = ""
    @State var firstResponderIndex: Int = 0
    @Binding var isStartViewIsOpened: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Отправили код на \(email)")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
            
            OneTimeCodeBoxes(codeDict: $codeDict, firstResponderIndex: $firstResponderIndex,
                             onCommit: {
                                print("onCommit", code)
                             })
                .onChange(of: codeDict){
                }
                .padding()
            
            Button(action: {
                isStartViewIsOpened = false
                dismiss()
                dismiss()
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 48)
                        .foregroundStyle(isButtonDisabled ? Color.specialDarkBlue : Color.specialBlue)
                    Text("Подтвердить")
                        .foregroundStyle(.white)
                }
            })
            .disabled(isButtonDisabled)
            .padding()
            
            Spacer()
        }
        .padding(.vertical)
    }
}

#Preview {
    OTPView(isStartViewIsOpened:.constant(true))
}
