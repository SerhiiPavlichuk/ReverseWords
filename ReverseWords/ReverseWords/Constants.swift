//
//  Constants.swift
//  ReverseWords
//
//  Created by admin on 16.10.2021.
//

import Foundation
import UIKit

struct Constants {
    
    struct ButtonActions {
        
        static let disabledButtonAlpha = CGFloat (0.6)
        static let enabledButtonAlpha = CGFloat (1)
        static let buttonReverseName = "Reverse"
        static let buttonClearName = "Clear"
    }
    
    struct Font {
        
        static let fontName = "SF Pro Display"
        static let userInputTextFieldFont = UIFont(name: Constants.Font.fontName, size: 17)
        static let reversedTextViewFont = UIFont(name: Constants.Font.fontName, size: 22)
    }
    
    struct UI {
        
        static let title = "Reverse Words"
        static let reverseAndClearButtonCornerRadius = CGFloat(14)
    }
    
    struct Symbols {
        
        static let separator = " "
    }
}
