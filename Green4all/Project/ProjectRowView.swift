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
                .scaledToFill()
                .cornerRadius(8.0)
                .frame(maxWidth: 110, maxHeight:110)
                .clipped()
            VStack (alignment: .leading) {
                
                Text(project.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Text("Progression")
                
                HStack {
                    Image(systemName: "person.fill")
                    Text("10")
                        .fontWeight(.bold)
                        .padding(.leading, -10.0)
                    
                    Image(systemName: "clock.arrow.circlepath")
                    Text("6J")
                        .fontWeight(.bold)
                        .padding(.leading, -9.0)
                    
                    Image(systemName: "eurosign.circle")
                    Text("\(project.budget)€")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -9.0)
                }//:HStack
            }//:VStack
            .padding(.horizontal, 10.0)
            .frame(idealWidth: 234, maxWidth: 235, idealHeight: 110, maxHeight: 110)
            
        }// :HSTACK
        .background(Color.white
                        .opacity(0.9))
        .cornerRadius(8.0)
        
    }
}

struct ProjectRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRowView(project: Project.project1)
    }
}
