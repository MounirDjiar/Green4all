//
//  ProgressBar.swift
//  Green4all
//
//  Created by Mounir DJIAR on 19/03/2021.
//

import Foundation
import SwiftUI

struct ProgressBar: View {
    
    var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.9)
                    .foregroundColor(Color(.systemGray4))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color("bgGreen"))
                    .animation(.linear)
            }.cornerRadius(8.0)
        }
    }
}
