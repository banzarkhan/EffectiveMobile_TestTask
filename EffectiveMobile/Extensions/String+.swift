//
//  String+.swift
//  EffectiveMobile
//
//  Created by Ariuna Banzarkhanova on 08/04/24.
//

import Foundation

extension String {
    
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
    
    /// - returns: a string has only 1 character
    func stringAt(index: Int) -> String {
        let stringIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[stringIndex])
    }
    
}
