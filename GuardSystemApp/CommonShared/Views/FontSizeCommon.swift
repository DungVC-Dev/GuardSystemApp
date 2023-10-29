//
//  FontCommon.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 28/10/2023.
//

import Foundation
import SwiftUI

enum CustomFont: String {
    case openSans = "Open Sans"
    case averiaSansLibre = "Averia Sans Libre"
}

extension Font {
    static func customFontSize(font: CustomFont, weight: Font.Weight, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
            .weight(weight)
    }
}
