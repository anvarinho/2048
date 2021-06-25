//
//  TileView.swift
//  2048
//
//  Created by Anvar Jumabaev on 12.06.21.
//

import Foundation
import SwiftUI

struct TileView: View{
    var number: Int
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(TileColors.instance.getColor(number))
            Text("\(number)")
                .font(.system(size: 34, weight: .bold, design: .monospaced))
        }.frame(width: 72, height: 72)
    }
}
