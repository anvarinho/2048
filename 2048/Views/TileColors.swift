//
//  TileColors.swift
//  2048
//
//  Created by Anvar Jumabaev on 12.06.21.
//

import Foundation
import SwiftUI

class TileColors: ObservableObject {
    static let instance = TileColors()
    
    func getColor(_ num: Int) -> Color {
        switch num {
        case 2:             return Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        case 4:             return Color(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1))
        case 8:             return Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1))
        case 16:            return Color(#colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1))
        case 32:            return Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1))
        case 64:            return Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        case 128:           return Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        case 256:           return Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
        case 512:           return Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        case 1028:          return Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        case 2048:          return Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))
        default:            return Color(#colorLiteral(red: 0.9725490196, green: 0.9411764706, blue: 0.8901960784, alpha: 1))
        }
    }
}
