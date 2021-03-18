//
//  GuideFirstPage.swift
//  Green4all
//
//  Created by emm on 18/03/2021.
//

import SwiftUI



//MARK: - /////////////////////    \\\\\\\\\\\\\\\\\\\\\\\

struct GuideFirstPage: View {
    var body: some View {
        VStack {
            Grid()
        }
    }
}




//MARK: - /////////////////////    \\\\\\\\\\\\\\\\\\\\\\\

struct Grid: View {
    var guideI:[String] = ["i1","i2","i3","i4","i5","i6","i7","i8"]
    
    var body: some View {
       
        let col = [
            GridItem(.flexible()),
            GridItem(.flexible())
                     
        ]
        
        NavigationView {
            
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: col) {
                
                ForEach(guideI, id: \.self) { app in
                    VStack {
                        Image(app)
                            .resizable()
                            .scaledToFill()
                            
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    
                }
                
            }
            .padding(.top)
            }
        
            
        .navigationBarTitle("Categories")
        }
    }
}




//MARK: - /////////////////////    \\\\\\\\\\\\\\\\\\\\\\\

struct GuideFirstPage_Previews: PreviewProvider {
    static var previews: some View {
        GuideFirstPage()
    }
}
