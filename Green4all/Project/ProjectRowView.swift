//
//  ProjectRowView.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import SwiftUI

struct ProjectRowView: View {
    
    let project:Project
    
    var body: some View {
        HStack {
            Image(project.picture)
                .resizable()
                .scaledToFit()
                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                .frame(width: 110, height:110)
                .clipped()
            
            VStack (alignment: .leading){
                Text(project.title)
                Text("Progression")
                HStack {
                    Image(systemName: "person.fill")
                    Text("10")
                        .padding(.leading, -10.0)
                                                
                    Image(systemName: "clock.arrow.circlepath")
                    Text("6J")
                        .padding(.leading, -8.0)
                    
                    Image(systemName: "eurosign.circle")
                    Text("\(project.budget)€")
                }
            }
        } // :HSTACK
        .background(Color("bgGreen"))
        .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
        
    }
}

struct ProjectRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRowView(project: Project.project1)
    }
}
