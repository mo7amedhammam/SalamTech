//
//  extension.swift
//  SalamTak
//
//  Created by wecancity on 29/12/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let salamtackBlue = Color("blueColor")
    static let salamtackWelcome = Color("newWelcome")


}

extension String {

    var byLines: [SubSequence] { components(separated: .byLines) }
    var byWords: [SubSequence] { components(separated: .byWords) }

    func components(separated options: String.EnumerationOptions)-> [SubSequence] {
        var components: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: options) { _, range, _, _ in components.append(self[range]) }
        return components
    }

    var firstWord: SubSequence? {
        var word: SubSequence?
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, stop in
            word = self[range]
            stop = true
        }
        return word
    }
    var firstLine: SubSequence? {
        var line: SubSequence?
        enumerateSubstrings(in: startIndex..., options: .byLines) { _, range, _, stop in
            line = self[range]
            stop = true
        }
        return line
    }
}
